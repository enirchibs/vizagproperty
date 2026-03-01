import { useState, useRef, useEffect } from 'react'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { Home, Upload, X, Camera, MessageCircle } from 'lucide-react'
import { VizagLocality, PropertyCategory, ResidentialPropertyType, CommercialPropertyType, PropertyType, ListingType } from '../types'
import { AuthGuard } from '../components/AuthGuard'
import { openWhatsApp } from '../lib/whatsapp'

interface PropertyDetails {
  [key: string]: string
}

export function AddPropertyPage() {
  const { user, profile } = useAuth()
  const [loading, setLoading] = useState(false)
  const [uploadingImages, setUploadingImages] = useState(false)
  const [selectedFiles, setSelectedFiles] = useState<File[]>([])
  const [imagePreviews, setImagePreviews] = useState<string[]>([])
  const [showCamera, setShowCamera] = useState(false)
  const [localities, setLocalities] = useState<VizagLocality[]>([])
  const [locality, setLocality] = useState('')
  const [showLocalityDropdown, setShowLocalityDropdown] = useState(false)
  const [successMessage, setSuccessMessage] = useState('')
  const [errorMessage, setErrorMessage] = useState('')
  const localityDropdownRef = useRef<HTMLDivElement>(null)
  const videoRef = useRef<HTMLVideoElement>(null)
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const streamRef = useRef<MediaStream | null>(null)
  const fetchTimeoutRef = useRef<NodeJS.Timeout | null>(null)

  // Initialize form data without profile dependency to prevent re-renders
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    category: '' as PropertyCategory | '',
    property_type: '' as PropertyType | '',
    listing_type: 'sale' as ListingType,
    price: '',
    bedrooms: '',
    bathrooms: '',
    area_sqft: '',
    state: 'Andhra Pradesh',
    pincode: '',
    agent_name: '',
    agent_phone: '',
    agent_whatsapp: '',
    amenities: [] as string[]
  })

  const [propertyDetails, setPropertyDetails] = useState<PropertyDetails>({})

  const residentialTypes: ResidentialPropertyType[] = [
    'flat_apartment',
    'independent_house_villa',
    'plot_land',
    'pg_hostel',
    'farmhouse',
    'serviced_apartment',
    'other_residential'
  ]

  const commercialTypes: CommercialPropertyType[] = [
    'office',
    'shop',
    'showroom',
    'warehouse',
    'industrial_land',
    'commercial_plot',
    'commercial_farmhouse',
    'coworking_space',
    'other_commercial'
  ]

  const propertyTypeLabels: Record<PropertyType, string> = {
    'flat_apartment': 'Flat / Apartment',
    'independent_house_villa': 'Independent House / Villa',
    'plot_land': 'Plot / Land',
    'pg_hostel': 'PG / Hostel',
    'farmhouse': 'Farmhouse',
    'serviced_apartment': 'Serviced Apartment',
    'other_residential': 'Other Residential',
    'office': 'Office',
    'shop': 'Shop',
    'showroom': 'Showroom',
    'warehouse': 'Warehouse',
    'industrial_land': 'Industrial Land',
    'commercial_plot': 'Commercial Plot',
    'commercial_farmhouse': 'Commercial Farmhouse',
    'coworking_space': 'Co-working Space',
    'other_commercial': 'Other Commercial'
  }

  const commonAmenities = ['Parking', 'Gym', 'Swimming Pool', 'Security', 'Power Backup', 'Elevator', 'Garden', 'Club House', 'WiFi', 'Furnished']

  // Set agent name from profile once, when profile loads (prevent re-render loops)
  useEffect(() => {
    if (profile && !formData.agent_name) {
      setFormData(prev => ({
        ...prev,
        agent_name: profile.name || profile.full_name || ''
      }))
    }
  }, [profile?.id]) // Only when profile ID changes (user logs in)

  const fetchLocalities = async (searchTerm: string) => {
    if (!user || searchTerm.length < 3) {
      setLocalities([])
      return
    }

    const { data, error } = await supabase
      .from('localities')
      .select('id, name, slug, pincode')
      .eq('city', 'Visakhapatnam')
      .ilike('name', `%${searchTerm}%`)
      .order('name', { ascending: true })
      .limit(10)

    if (!error && data) {
      setLocalities(data as any)
    } else {
      console.error('Failed to load localities', error)
      setLocalities([])
    }
  }

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (localityDropdownRef.current && !localityDropdownRef.current.contains(event.target as Node)) {
        setShowLocalityDropdown(false)
      }
    }

    document.addEventListener('mousedown', handleClickOutside)
    return () => {
      document.removeEventListener('mousedown', handleClickOutside)
      if (fetchTimeoutRef.current) {
        clearTimeout(fetchTimeoutRef.current)
      }
    }
  }, [])

  const getAvailablePropertyTypes = (): PropertyType[] => {
    if (formData.category === 'residential') return residentialTypes
    if (formData.category === 'commercial') return commercialTypes
    return []
  }

  const shouldShowBedrooms = (): boolean => {
    return ['flat_apartment', 'independent_house_villa', 'pg_hostel', 'serviced_apartment', 'farmhouse'].includes(formData.property_type)
  }

  const shouldShowBathrooms = (): boolean => {
    return ['flat_apartment', 'independent_house_villa', 'pg_hostel', 'serviced_apartment', 'farmhouse'].includes(formData.property_type)
  }

  const shouldShowFloorDetails = (): boolean => {
    return formData.property_type === 'flat_apartment'
  }

  const shouldShowPlotDetails = (): boolean => {
    return ['plot_land', 'commercial_plot', 'industrial_land'].includes(formData.property_type)
  }

  const shouldShowCommercialFarmhouseDetails = (): boolean => {
    return formData.property_type === 'commercial_farmhouse'
  }

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files || [])
    if (files.length === 0) return

    const imageFiles = files.filter(file => file.type.startsWith('image/'))
    if (imageFiles.length === 0) {
      alert('Please select valid image files')
      return
    }

    const remainingSlots = 4 - selectedFiles.length
    if (remainingSlots <= 0) {
      alert('Maximum 4 images allowed per property')
      return
    }

    const filesToAdd = imageFiles.slice(0, remainingSlots)
    if (imageFiles.length > remainingSlots) {
      alert(`Only ${remainingSlots} more image${remainingSlots > 1 ? 's' : ''} can be added. Maximum 4 images allowed.`)
    }

    const maxSize = 50 * 1024 * 1024
    const oversizedFiles = filesToAdd.filter(file => file.size > maxSize)
    if (oversizedFiles.length > 0) {
      alert('Some files are too large. Maximum size is 50MB per image.')
      return
    }

    setSelectedFiles(prev => [...prev, ...filesToAdd])

    filesToAdd.forEach(file => {
      const reader = new FileReader()
      reader.onloadend = () => {
        setImagePreviews(prev => [...prev, reader.result as string])
      }
      reader.readAsDataURL(file)
    })
  }

  const removeImage = (index: number) => {
    setSelectedFiles(prev => prev.filter((_, i) => i !== index))
    setImagePreviews(prev => prev.filter((_, i) => i !== index))
  }

  const startCamera = async () => {
    try {
      const stream = await navigator.mediaDevices.getUserMedia({
        video: { facingMode: 'environment' },
        audio: false
      })
      if (videoRef.current) {
        videoRef.current.srcObject = stream
        streamRef.current = stream
        setShowCamera(true)
      }
    } catch (error) {
      alert('Unable to access camera. Please check permissions.')
      console.error('Camera error:', error)
    }
  }

  const stopCamera = () => {
    if (streamRef.current) {
      streamRef.current.getTracks().forEach(track => track.stop())
      streamRef.current = null
    }
    setShowCamera(false)
  }

  const capturePhoto = () => {
    if (selectedFiles.length >= 4) {
      alert('Maximum 4 images allowed per property')
      return
    }

    if (videoRef.current && canvasRef.current) {
      const video = videoRef.current
      const canvas = canvasRef.current
      canvas.width = video.videoWidth
      canvas.height = video.videoHeight
      const ctx = canvas.getContext('2d')
      if (ctx) {
        ctx.drawImage(video, 0, 0)
        canvas.toBlob((blob) => {
          if (blob) {
            const file = new File([blob], `camera-${Date.now()}.jpg`, { type: 'image/jpeg' })
            setSelectedFiles(prev => [...prev, file])
            canvas.toBlob((previewBlob) => {
              if (previewBlob) {
                const previewUrl = URL.createObjectURL(previewBlob)
                setImagePreviews(prev => [...prev, previewUrl])
              }
            }, 'image/jpeg', 0.8)
          }
        }, 'image/jpeg', 0.9)
      }
    }
  }

  const uploadImages = async (): Promise<string[]> => {
    if (selectedFiles.length === 0) return []

    setUploadingImages(true)
    const uploadedUrls: string[] = []

    try {
      for (const file of selectedFiles) {
        const fileExt = file.name.split('.').pop()
        const fileName = `${user!.id}/${Date.now()}-${Math.random().toString(36).substring(7)}.${fileExt}`

        const { error: uploadError } = await supabase.storage
          .from('property-images')
          .upload(fileName, file)

        if (uploadError) throw uploadError

        const { data: { publicUrl } } = supabase.storage
          .from('property-images')
          .getPublicUrl(fileName)

        uploadedUrls.push(publicUrl)
      }

      return uploadedUrls
    } catch (error: any) {
      console.error('Error uploading images:', error)
      throw new Error('Failed to upload images: ' + error.message)
    } finally {
      setUploadingImages(false)
    }
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()

    if (!user?.id) {
      alert('Login required to post property')
      return
    }

    if (!formData.category) {
      alert('Please select a category')
      return
    }

    if (!formData.property_type) {
      alert('Please select a property type')
      return
    }

    if (selectedFiles.length === 0) {
      alert('Please add at least one property image')
      return
    }

    const matched = localities.find(l => (l as any).name === locality)

    if (!matched) {
      alert('Please select a locality from the list')
      return
    }

    setLoading(true)
    setErrorMessage('')
    setSuccessMessage('')

    try {
      stopCamera()

      const imageUrls = await uploadImages()

      const propertyData: any = {
        title: formData.title,
        description: formData.description,
        category: formData.category,
        property_type: formData.property_type,
        listing_type: formData.listing_type,
        price: parseFloat(formData.price),
        area_sqft: parseInt(formData.area_sqft),
        locality_id: matched.id,
        state: formData.state,
        pincode: (matched as any).pincode || null,
        amenities: formData.amenities,
        agent_name: formData.agent_name,
        agent_phone: formData.agent_phone,
        agent_whatsapp: formData.agent_whatsapp || null,
        owner_id: user.id,
        images: imageUrls,
        status: 'pending'
      }

      if (formData.bedrooms) {
        propertyData.bedrooms = parseInt(formData.bedrooms)
      }
      if (formData.bathrooms) {
        propertyData.bathrooms = parseInt(formData.bathrooms)
      }

      const { data: insertedProperty, error } = await supabase
        .from('properties')
        .insert(propertyData)
        .select('id')
        .single()

      if (error) throw error

      if (insertedProperty && Object.keys(propertyDetails).length > 0) {
        const detailsToInsert = Object.entries(propertyDetails).map(([key, value]) => ({
          property_id: insertedProperty.id,
          key,
          value
        }))

        const { error: detailsError } = await supabase
          .from('property_details')
          .insert(detailsToInsert)

        if (detailsError) {
          console.error('Error saving property details:', detailsError)
        }
      }

      setSuccessMessage('Property submitted for review! Our team will review and approve it shortly.')

      setTimeout(() => {
        window.location.href = '/my-listings'
      }, 1500)
    } catch (error: any) {
      setErrorMessage(error.message || 'Failed to add property')
    } finally {
      setLoading(false)
    }
  }

  const toggleAmenity = (amenity: string) => {
    setFormData(prev => ({
      ...prev,
      amenities: prev.amenities.includes(amenity)
        ? prev.amenities.filter(a => a !== amenity)
        : [...prev.amenities, amenity]
    }))
  }

  const updatePropertyDetail = (key: string, value: string) => {
    setPropertyDetails(prev => ({
      ...prev,
      [key]: value
    }))
  }

  return (
    <AuthGuard>
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-4xl mx-auto px-4">
        <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-8">
          <div className="flex items-center space-x-3 mb-6">
            <Home className="h-8 w-8 text-primary-600" />
            <h1 className="text-3xl font-bold text-gray-900">List Your Property</h1>
          </div>

          {successMessage && (
            <div className="mb-6 p-4 bg-green-50 border border-green-200 rounded-lg">
              <p className="text-green-800 font-medium">{successMessage}</p>
            </div>
          )}

          {errorMessage && (
            <div className="mb-6 p-4 bg-red-50 border border-red-200 rounded-lg">
              <p className="text-red-800 font-medium">{errorMessage}</p>
            </div>
          )}

          <div className="mb-8 p-6 bg-gradient-to-r from-green-50 to-emerald-50 rounded-xl border-2 border-green-200">
            <div className="flex flex-col md:flex-row items-center justify-between gap-4">
              <div className="flex-1">
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Prefer WhatsApp? List via WhatsApp!</h3>
                <p className="text-sm text-gray-600">Share property details directly on WhatsApp and our team will list it for you within 24 hours.</p>
              </div>
              <button
                onClick={() => openWhatsApp('Hi, I want to post my property in Vizag listed on VizagProperty. Please share more details.')}
                className="inline-flex items-center gap-2 bg-green-600 text-white px-6 py-3 rounded-full hover:bg-green-700 transition-all font-semibold shadow-lg whitespace-nowrap"
              >
                <MessageCircle className="h-5 w-5" />
                <span>Post Property via WhatsApp</span>
              </button>
            </div>
          </div>

          <div className="mb-6 text-center">
            <div className="relative">
              <div className="absolute inset-0 flex items-center">
                <div className="w-full border-t border-gray-300"></div>
              </div>
              <div className="relative flex justify-center text-sm">
                <span className="px-4 bg-white text-gray-500">OR fill the form below</span>
              </div>
            </div>
          </div>

          <form onSubmit={handleSubmit} className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Property Category <span className="text-red-500">*</span>
                </label>
                <div className="grid grid-cols-2 gap-4">
                  <button
                    type="button"
                    onClick={() => {
                      setFormData({ ...formData, category: 'residential', property_type: '' })
                      setPropertyDetails({})
                    }}
                    className={`px-6 py-4 rounded-lg border-2 transition-all ${
                      formData.category === 'residential'
                        ? 'bg-primary-600 text-white border-primary-600'
                        : 'border-gray-300 text-gray-700 hover:border-primary-300'
                    }`}
                  >
                    <div className="text-lg font-semibold">Residential</div>
                    <div className="text-xs mt-1 opacity-80">Homes, Flats, Plots</div>
                  </button>
                  <button
                    type="button"
                    onClick={() => {
                      setFormData({ ...formData, category: 'commercial', property_type: '' })
                      setPropertyDetails({})
                    }}
                    className={`px-6 py-4 rounded-lg border-2 transition-all ${
                      formData.category === 'commercial'
                        ? 'bg-primary-600 text-white border-primary-600'
                        : 'border-gray-300 text-gray-700 hover:border-primary-300'
                    }`}
                  >
                    <div className="text-lg font-semibold">Commercial</div>
                    <div className="text-xs mt-1 opacity-80">Office, Shop, Warehouse</div>
                  </button>
                </div>
              </div>

              {formData.category && (
                <div className="md:col-span-2">
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Property Type <span className="text-red-500">*</span>
                  </label>
                  <select
                    required
                    value={formData.property_type}
                    onChange={(e) => {
                      setFormData({ ...formData, property_type: e.target.value as PropertyType })
                      setPropertyDetails({})
                    }}
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  >
                    <option value="">Select Property Type</option>
                    {getAvailablePropertyTypes().map(type => (
                      <option key={type} value={type}>
                        {propertyTypeLabels[type]}
                      </option>
                    ))}
                  </select>
                </div>
              )}

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Property Title
                </label>
                <input
                  type="text"
                  required
                  value={formData.title}
                  onChange={(e) => setFormData({ ...formData, title: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="e.g., Spacious 2BHK Apartment in Madhurawada"
                />
              </div>

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Description
                </label>
                <textarea
                  required
                  value={formData.description}
                  onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                  rows={4}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="Describe your property..."
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Listing Type
                </label>
                <select
                  required
                  value={formData.listing_type}
                  onChange={(e) => setFormData({ ...formData, listing_type: e.target.value as ListingType })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                >
                  <option value="sale">Sale</option>
                  <option value="rent">Rent</option>
                  <option value="lease">Lease</option>
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Price (₹)
                </label>
                <input
                  type="number"
                  required
                  value={formData.price}
                  onChange={(e) => setFormData({ ...formData, price: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="5000000"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Area (sqft)
                </label>
                <input
                  type="number"
                  required
                  value={formData.area_sqft}
                  onChange={(e) => setFormData({ ...formData, area_sqft: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="1200"
                />
              </div>

              {shouldShowBedrooms() && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Bedrooms
                  </label>
                  <input
                    type="number"
                    value={formData.bedrooms}
                    onChange={(e) => setFormData({ ...formData, bedrooms: e.target.value })}
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                    min="0"
                    placeholder="2"
                  />
                </div>
              )}

              {shouldShowBathrooms() && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Bathrooms
                  </label>
                  <input
                    type="number"
                    value={formData.bathrooms}
                    onChange={(e) => setFormData({ ...formData, bathrooms: e.target.value })}
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                    min="0"
                    placeholder="2"
                  />
                </div>
              )}

              {shouldShowFloorDetails() && (
                <>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Floor Number
                    </label>
                    <input
                      type="text"
                      value={propertyDetails.floor_number || ''}
                      onChange={(e) => updatePropertyDetail('floor_number', e.target.value)}
                      className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                      placeholder="e.g., 3rd Floor"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Total Floors
                    </label>
                    <input
                      type="number"
                      value={propertyDetails.total_floors || ''}
                      onChange={(e) => updatePropertyDetail('total_floors', e.target.value)}
                      className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                      placeholder="10"
                    />
                  </div>
                </>
              )}

              {shouldShowPlotDetails() && (
                <>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Boundary Wall
                    </label>
                    <select
                      value={propertyDetails.boundary_wall || ''}
                      onChange={(e) => updatePropertyDetail('boundary_wall', e.target.value)}
                      className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                    >
                      <option value="">Select</option>
                      <option value="yes">Yes</option>
                      <option value="no">No</option>
                      <option value="partial">Partial</option>
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Plot Facing
                    </label>
                    <select
                      value={propertyDetails.plot_facing || ''}
                      onChange={(e) => updatePropertyDetail('plot_facing', e.target.value)}
                      className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                    >
                      <option value="">Select</option>
                      <option value="north">North</option>
                      <option value="south">South</option>
                      <option value="east">East</option>
                      <option value="west">West</option>
                      <option value="north-east">North-East</option>
                      <option value="north-west">North-West</option>
                      <option value="south-east">South-East</option>
                      <option value="south-west">South-West</option>
                    </select>
                  </div>
                </>
              )}

              {shouldShowCommercialFarmhouseDetails() && (
                <>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Number of Rooms
                    </label>
                    <input
                      type="number"
                      value={propertyDetails.rooms || ''}
                      onChange={(e) => updatePropertyDetail('rooms', e.target.value)}
                      className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                      placeholder="6"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Events Allowed
                    </label>
                    <select
                      value={propertyDetails.event_allowed || ''}
                      onChange={(e) => updatePropertyDetail('event_allowed', e.target.value)}
                      className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                    >
                      <option value="">Select</option>
                      <option value="yes">Yes</option>
                      <option value="no">No</option>
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Swimming Pool
                    </label>
                    <select
                      value={propertyDetails.swimming_pool || ''}
                      onChange={(e) => updatePropertyDetail('swimming_pool', e.target.value)}
                      className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                    >
                      <option value="">Select</option>
                      <option value="yes">Yes</option>
                      <option value="no">No</option>
                    </select>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Parking Capacity
                    </label>
                    <input
                      type="number"
                      value={propertyDetails.parking_capacity || ''}
                      onChange={(e) => updatePropertyDetail('parking_capacity', e.target.value)}
                      className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                      placeholder="20"
                    />
                  </div>
                </>
              )}

              <div className="md:col-span-2 relative" ref={localityDropdownRef}>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Locality <span className="text-red-500">*</span>
                </label>

                <input
                  type="text"
                  value={locality}
                  onChange={(e) => {
                    const v = e.target.value
                    setLocality(v)
                    setFormData({ ...formData, pincode: '' })

                    if (fetchTimeoutRef.current) {
                      clearTimeout(fetchTimeoutRef.current)
                    }

                    if (v.length >= 3) {
                      fetchTimeoutRef.current = setTimeout(() => {
                        fetchLocalities(v)
                      }, 300)
                      setShowLocalityDropdown(true)
                    } else {
                      setLocalities([])
                      setShowLocalityDropdown(false)
                    }
                  }}
                  onFocus={() => {
                    if (locality.length >= 3) {
                      setShowLocalityDropdown(true)
                    }
                  }}
                  placeholder="Type 3+ characters to search Vizag localities"
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  autoComplete="off"
                />

                {showLocalityDropdown && locality.length >= 3 && (
                  <div className="absolute z-10 w-full mt-1 bg-white border border-gray-300 rounded-lg shadow-lg max-h-60 overflow-y-auto">
                    {localities.length > 0 ? (
                      localities.map(loc => (
                        <div
                          key={loc.id}
                          onClick={() => {
                            setLocality((loc as any).name)
                            setFormData({ ...formData, pincode: (loc as any).pincode || '' })
                            setShowLocalityDropdown(false)
                          }}
                          className="px-4 py-3 hover:bg-primary-50 cursor-pointer transition-colors border-b border-gray-100 last:border-b-0"
                        >
                          <div className="font-medium text-gray-900">{(loc as any).name}</div>
                          {(loc as any).pincode && (
                            <div className="text-sm text-gray-500">Pincode: {(loc as any).pincode}</div>
                          )}
                        </div>
                      ))
                    ) : (
                      <div className="px-4 py-3 text-gray-500 text-sm">
                        No localities found matching "{locality}"
                      </div>
                    )}
                  </div>
                )}

                <p className="text-sm text-gray-500 mt-1">
                  All properties must be in Visakhapatnam (Vizag) area
                </p>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Pincode
                </label>
                <input
                  type="text"
                  value={formData.pincode}
                  readOnly
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg bg-gray-100 cursor-not-allowed"
                  placeholder="Auto-filled from locality"
                />
              </div>

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Amenities
                </label>
                <div className="grid grid-cols-2 md:grid-cols-4 gap-2">
                  {commonAmenities.map(amenity => (
                    <button
                      key={amenity}
                      type="button"
                      onClick={() => toggleAmenity(amenity)}
                      className={`px-4 py-2 rounded-lg border transition-colors ${
                        formData.amenities.includes(amenity)
                          ? 'bg-primary-600 text-white border-primary-600'
                          : 'border-gray-300 text-gray-700 hover:border-primary-300'
                      }`}
                    >
                      {amenity}
                    </button>
                  ))}
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Agent Name
                </label>
                <input
                  type="text"
                  required
                  value={formData.agent_name}
                  onChange={(e) => setFormData({ ...formData, agent_name: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Contact Phone
                </label>
                <input
                  type="tel"
                  required
                  value={formData.agent_phone}
                  onChange={(e) => setFormData({ ...formData, agent_phone: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="+91 9876543210"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  WhatsApp Number (Optional)
                </label>
                <input
                  type="tel"
                  value={formData.agent_whatsapp}
                  onChange={(e) => setFormData({ ...formData, agent_whatsapp: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="+91 9876543210"
                />
              </div>

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Property Images <span className="text-red-500">*</span>
                  <span className="text-xs font-normal text-gray-500 ml-2">(Maximum 4 images, 50MB each)</span>
                </label>
                <div className="space-y-4">
                  <div className="flex gap-2">
                    <label className={`flex-1 flex flex-col items-center justify-center h-32 border-2 border-gray-300 border-dashed rounded-lg ${selectedFiles.length >= 4 ? 'cursor-not-allowed opacity-50' : 'cursor-pointer hover:bg-gray-100'} bg-gray-50 transition-colors`}>
                      <div className="flex flex-col items-center justify-center pt-5 pb-6">
                        <Upload className="h-10 w-10 text-gray-400 mb-2" />
                        <p className="text-sm text-gray-500 font-semibold">
                          {selectedFiles.length >= 4 ? 'Maximum reached' : 'Upload Images'}
                        </p>
                        <p className="text-xs text-gray-500">PNG, JPG (MAX 4 images, 50MB each)</p>
                      </div>
                      <input
                        type="file"
                        className="hidden"
                        accept="image/*"
                        multiple
                        disabled={selectedFiles.length >= 4}
                        onChange={handleFileSelect}
                      />
                    </label>

                    <button
                      type="button"
                      onClick={showCamera ? stopCamera : startCamera}
                      className={`w-32 flex flex-col items-center justify-center border-2 border-dashed rounded-lg transition-colors ${
                        showCamera
                          ? 'bg-red-50 border-red-300 text-red-600 hover:bg-red-100'
                          : 'bg-blue-50 border-blue-300 text-blue-600 hover:bg-blue-100'
                      }`}
                    >
                      <Camera className="h-10 w-10 mb-2" />
                      <p className="text-sm font-semibold">{showCamera ? 'Stop' : 'Camera'}</p>
                    </button>
                  </div>

                  {showCamera && (
                    <div className="relative">
                      <video
                        ref={videoRef}
                        autoPlay
                        playsInline
                        className="w-full rounded-lg border border-gray-300"
                      />
                      <button
                        type="button"
                        onClick={capturePhoto}
                        className="absolute bottom-4 left-1/2 transform -translate-x-1/2 bg-white text-gray-900 px-6 py-3 rounded-full shadow-lg hover:bg-gray-100 transition-colors font-medium"
                      >
                        Capture Photo
                      </button>
                      <canvas ref={canvasRef} className="hidden" />
                    </div>
                  )}

                  {imagePreviews.length > 0 && (
                    <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
                      {imagePreviews.map((preview, index) => (
                        <div key={index} className="relative group">
                          <img
                            src={preview}
                            alt={`Preview ${index + 1}`}
                            className="w-full h-32 object-cover rounded-lg border border-gray-200"
                          />
                          <button
                            type="button"
                            onClick={() => removeImage(index)}
                            className="absolute top-2 right-2 p-1 bg-red-500 text-white rounded-full opacity-0 group-hover:opacity-100 transition-opacity hover:bg-red-600"
                          >
                            <X className="h-4 w-4" />
                          </button>
                        </div>
                      ))}
                    </div>
                  )}

                  {selectedFiles.length > 0 && (
                    <p className="text-sm text-gray-600">
                      {selectedFiles.length} image{selectedFiles.length > 1 ? 's' : ''} selected
                    </p>
                  )}
                </div>
              </div>
            </div>

            <button
              type="submit"
              disabled={loading || uploadingImages}
              className="w-full bg-primary-600 text-white py-3 rounded-lg hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-medium text-lg"
            >
              {uploadingImages ? 'Uploading Images...' : loading ? 'Submitting...' : 'List Property'}
            </button>
          </form>
        </div>
      </div>
    </div>
    </AuthGuard>
  )
}
