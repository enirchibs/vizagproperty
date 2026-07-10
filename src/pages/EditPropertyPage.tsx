import { useState, useEffect, useRef } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { Home, Upload, X, ArrowLeft } from 'lucide-react'
import { VizagLocality, Property } from '../types'

export function EditPropertyPage() {
  const { id } = useParams()
  const navigate = useNavigate()
  const { user, profile } = useAuth()
  const [loading, setLoading] = useState(false)
  const [initialLoading, setInitialLoading] = useState(true)
  const [property, setProperty] = useState<Property | null>(null)
  const [uploadingImages, setUploadingImages] = useState(false)
  const [selectedFiles, setSelectedFiles] = useState<File[]>([])
  const [imagePreviews, setImagePreviews] = useState<string[]>([])
  const [localities, setLocalities] = useState<VizagLocality[]>([])
  const [locality, setLocality] = useState('')
  const [showLocalityDropdown, setShowLocalityDropdown] = useState(false)
  const [successMessage, setSuccessMessage] = useState('')
  const [errorMessage, setErrorMessage] = useState('')
  const localityDropdownRef = useRef<HTMLDivElement>(null)
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    property_type: 'flat',
    listing_type: 'sale',
    price: '',
    bedrooms: '2',
    bathrooms: '2',
    area_sqft: '',
    state: 'Andhra Pradesh',
    pincode: '',
    agent_name: profile?.full_name || '',
    agent_phone: '',
    agent_whatsapp: '',
    amenities: [] as string[]
  })

  // Only load property when id changes (not on every user/auth state change)
  useEffect(() => {
    if (!user || !id) return
    loadProperty()
  }, [id]) // Only depend on id to prevent infinite loops

  const fetchTimeoutRef = useRef<NodeJS.Timeout | null>(null)

  useEffect(() => {
    return () => {
      if (fetchTimeoutRef.current) {
        clearTimeout(fetchTimeoutRef.current)
      }
    }
  }, [])

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (localityDropdownRef.current && !localityDropdownRef.current.contains(event.target as Node)) {
        setShowLocalityDropdown(false)
      }
    }
    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  const loadProperty = async () => {
    if (!id) return

    try {
      const { data, error } = await supabase
        .from('properties')
        .select('*')
        .eq('id', id)
        .maybeSingle()

      if (error) throw error
      if (!data) {
        alert('Property not found')
        navigate('/my-listings')
        return
      }

      if (data.owner_id !== user?.id && profile?.role !== 'admin') {
        alert('You do not have permission to edit this property')
        navigate('/my-listings')
        return
      }

      setProperty(data)
      setFormData({
        title: data.title,
        description: data.description,
        property_type: data.property_type,
        listing_type: data.listing_type,
        price: data.price.toString(),
        bedrooms: data.bedrooms.toString(),
        bathrooms: data.bathrooms.toString(),
        area_sqft: data.area_sqft.toString(),
        state: data.state,
        pincode: data.pincode || '',
        agent_name: data.agent_name,
        agent_phone: data.agent_phone,
        agent_whatsapp: data.agent_whatsapp || '',
        amenities: data.amenities || []
      })
      setImagePreviews(data.images || [])

      const { data: localityData } = await supabase
        .from('localities')
        .select('name')
        .eq('id', data.locality_id)
        .maybeSingle()

      if (localityData) {
        setLocality(localityData.name)
      }
    } catch (err) {
      alert('Failed to load property')
      navigate('/my-listings')
    } finally {
      setInitialLoading(false)
    }
  }

  const fetchLocalities = async (searchTerm: string) => {
    if (!user || searchTerm.length < 2) {
      setLocalities([])
      return
    }

    try {
      const { data, error } = await supabase.functions.invoke('location-autocomplete', {
        body: { query: searchTerm, limit: 10 }
      })

      if (error) throw error

      const mapped = (data || []).map((item: any) => {
        const nameOnly = item.display_name.split(',')[0].trim()
        return {
          id: item.id,
          name: nameOnly,
          pincode: item.pincode || ''
        }
      })

      setLocalities(mapped)
    } catch (err) {
      console.error('Error fetching localities:', err)
      setLocalities([])
    }
  }

  const propertyTypes = ['flat', 'plot', 'villa', 'pg']
  const propertyTypeLabels: Record<string, string> = {
    'flat': 'Flat',
    'plot': 'Plot',
    'villa': 'Villa',
    'pg': 'PG / Hostel'
  }
  const commonAmenities = ['Parking', 'Gym', 'Swimming Pool', 'Security', 'Power Backup', 'Elevator', 'Garden', 'Club House', 'WiFi', 'Furnished']

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files || [])
    if (files.length === 0) return

    const imageFiles = files.filter(file => file.type.startsWith('image/'))
    if (imageFiles.length === 0) {
      alert('Please select valid image files')
      return
    }

    const totalImages = imagePreviews.length + selectedFiles.length
    const remainingSlots = 4 - totalImages
    if (remainingSlots <= 0) {
      alert('Maximum 4 images allowed per property')
      return
    }

    const filesToAdd = imageFiles.slice(0, remainingSlots)
    setSelectedFiles(prev => [...prev, ...filesToAdd])

    const newPreviews = filesToAdd.map(file => URL.createObjectURL(file))
    setImagePreviews(prev => [...prev, ...newPreviews])
  }

  const removeImage = (index: number) => {
    const existingImagesLength = property?.images?.length || 0
    const isExistingImage = index < existingImagesLength

    if (isExistingImage) {
      setImagePreviews(prev => prev.filter((_, i) => i !== index))
    } else {
      const fileIndex = index - existingImagesLength
      setSelectedFiles(prev => prev.filter((_, i) => i !== fileIndex))
      setImagePreviews(prev => prev.filter((_, i) => i !== index))
    }
  }

  const uploadImages = async () => {
    if (selectedFiles.length === 0) return []

    setUploadingImages(true)
    try {
      const uploadedUrls: string[] = []

      for (const file of selectedFiles) {
        const fileExt = file.name.split('.').pop()
        const fileName = `${Math.random().toString(36).substring(2)}-${Date.now()}.${fileExt}`

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
      throw new Error('Failed to upload images: ' + error.message)
    } finally {
      setUploadingImages(false)
    }
  }

  const handleUpdateProperty = async (e: React.FormEvent) => {
    e.preventDefault()

    if (!user?.id || !property) {
      alert('Invalid request')
      return
    }

    if (imagePreviews.length === 0) {
      alert('Please add at least one property image')
      return
    }

    setLoading(true)
    try {
      let finalLocalityId = null
      let finalPincode = null

      if (locality.trim()) {
        const matched = localities.find(l => (l as any).name.toLowerCase() === locality.trim().toLowerCase())
        if (matched) {
          finalLocalityId = matched.id
          finalPincode = (matched as any).pincode || null
        } else {
          // Check database exactly
          const { data: exactLocs } = await supabase
            .from('localities')
            .select('id, pincode')
            .ilike('name', locality.trim())
            .limit(1)

          if (exactLocs && exactLocs.length > 0) {
            finalLocalityId = exactLocs[0].id
            finalPincode = exactLocs[0].pincode || null
          } else {
            // Auto-create locality
            const baseSlug = locality.trim().toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '')
            const uniqueSlug = `${baseSlug}-${Math.random().toString(36).substring(2, 6)}`
            
            const { data: newLoc, error: insertErr } = await supabase
              .from('localities')
              .insert({
                name: locality.trim(),
                slug: uniqueSlug,
                city: 'Visakhapatnam'
              })
              .select('id')
              .single()

            if (!insertErr && newLoc) {
              finalLocalityId = newLoc.id
            }
          }
        }
      }

      const newImageUrls = await uploadImages()
      const existingImages = imagePreviews.filter(url => !url.startsWith('blob:'))
      const allImages = [...existingImages, ...newImageUrls]

      const updateData: any = {
        title: formData.title,
        description: formData.description,
        property_type: formData.property_type,
        listing_type: formData.listing_type,
        price: parseFloat(formData.price),
        bedrooms: parseInt(formData.bedrooms),
        bathrooms: parseInt(formData.bathrooms),
        area_sqft: parseInt(formData.area_sqft),
        locality_id: finalLocalityId,
        state: formData.state,
        pincode: finalPincode || formData.pincode || null,
        amenities: formData.amenities,
        agent_name: formData.agent_name,
        agent_phone: formData.agent_phone,
        agent_whatsapp: formData.agent_whatsapp || null,
        images: allImages,
        updated_at: new Date().toISOString()
      }

      const { error } = await supabase
        .from('properties')
        .update(updateData)
        .eq('id', property.id)

      if (error) throw error

      setSuccessMessage('Property updated and sent for re-approval! Redirecting...')
      setErrorMessage('')

      setTimeout(() => {
        navigate('/my-listings')
      }, 2000)
    } catch (error: any) {
      setErrorMessage(error.message || 'Failed to update property')
      setSuccessMessage('')
    } finally {
      setLoading(false)
    }
  }

  if (!user) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Please sign in</h2>
          <a href="/" className="text-primary-600 hover:text-primary-700">
            Go to home
          </a>
        </div>
      </div>
    )
  }

  if (initialLoading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading property...</p>
        </div>
      </div>
    )
  }

  // Localities are already fetched dynamically from search.locations

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-6">
          <button
            onClick={() => navigate('/my-listings')}
            className="flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-4"
          >
            <ArrowLeft className="h-5 w-5" />
            Back to My Listings
          </button>
          <div className="flex items-center gap-3 mb-2">
            <Home className="h-8 w-8 text-primary-600" />
            <h1 className="text-3xl md:text-4xl font-bold text-gray-900">Edit Property</h1>
          </div>
          <p className="text-gray-600">Update your property details</p>
        </div>

        {successMessage && (
          <div className="mb-6 p-4 bg-green-100 border border-green-400 text-green-700 rounded-lg">
            {successMessage}
          </div>
        )}

        {errorMessage && (
          <div className="mb-6 p-4 bg-red-100 border border-red-400 text-red-700 rounded-lg">
            {errorMessage}
          </div>
        )}

        {property?.status === 'rejected' && property?.rejection_reason && (
          <div className="mb-6 p-4 bg-red-50 border border-red-300 rounded-lg">
            <p className="text-red-900 font-semibold mb-2">Property Rejected</p>
            <p className="text-red-700 text-sm mb-2">
              <strong>Reason:</strong> {property.rejection_reason}
            </p>
            <p className="text-red-600 text-sm">
              Please fix the issues mentioned above and save your changes to resubmit for approval.
            </p>
          </div>
        )}

        {property?.status === 'approved' && property?.owner_id === user?.id && profile?.role !== 'admin' && (
          <div className="mb-6 p-4 bg-yellow-50 border border-yellow-300 rounded-lg">
            <p className="text-yellow-800">
              <strong>Note:</strong> Editing this property will send it for re-approval.
            </p>
          </div>
        )}

        <div className="bg-white rounded-2xl shadow-lg p-6 md:p-8">
          <form onSubmit={handleUpdateProperty} className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
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
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Property Type
                </label>
                <select
                  required
                  value={formData.property_type}
                  onChange={(e) => setFormData({ ...formData, property_type: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                >
                  {propertyTypes.map(type => (
                    <option key={type} value={type}>
                      {propertyTypeLabels[type]}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Listing Type
                </label>
                <select
                  required
                  value={formData.listing_type}
                  onChange={(e) => setFormData({ ...formData, listing_type: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                >
                  <option value="sale">For Sale</option>
                  <option value="rent">For Rent</option>
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
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Area (sq ft)
                </label>
                <input
                  type="number"
                  required
                  value={formData.area_sqft}
                  onChange={(e) => setFormData({ ...formData, area_sqft: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Bedrooms
                </label>
                <input
                  type="number"
                  required
                  value={formData.bedrooms}
                  onChange={(e) => setFormData({ ...formData, bedrooms: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Bathrooms
                </label>
                <input
                  type="number"
                  required
                  value={formData.bathrooms}
                  onChange={(e) => setFormData({ ...formData, bathrooms: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>

              <div className="md:col-span-2 relative" ref={localityDropdownRef}>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Locality <span className="text-gray-400 text-xs font-normal">(Optional)</span>
                </label>
                <input
                  type="text"
                  value={locality}
                  onChange={(e) => {
                    const v = e.target.value
                    setLocality(v)
                    if (fetchTimeoutRef.current) {
                      clearTimeout(fetchTimeoutRef.current)
                    }
                    if (v.length >= 2) {
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
                    if (locality.length >= 2) {
                      setShowLocalityDropdown(true)
                    }
                  }}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="Type 2+ characters to search localities..."
                  autoComplete="off"
                />
                {showLocalityDropdown && localities.length > 0 && (
                  <div className="absolute z-10 mt-1 w-full max-w-2xl bg-white border border-gray-300 rounded-lg shadow-lg max-h-[300px] overflow-y-auto">
                    {localities.map((loc: any) => (
                      <button
                        key={loc.id}
                        type="button"
                        onClick={() => {
                          setLocality(loc.name)
                          setShowLocalityDropdown(false)
                        }}
                        className="w-full text-left px-4 py-2.5 hover:bg-gray-100 transition-colors border-b border-gray-50 last:border-b-0"
                      >
                        {loc.name}
                      </button>
                    ))}
                  </div>
                )}
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Contact Name
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
                />
              </div>

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  WhatsApp Number (Optional)
                </label>
                <input
                  type="tel"
                  value={formData.agent_whatsapp}
                  onChange={(e) => setFormData({ ...formData, agent_whatsapp: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Amenities
                </label>
                <div className="grid grid-cols-2 md:grid-cols-3 gap-2">
                  {commonAmenities.map(amenity => (
                    <label key={amenity} className="flex items-center space-x-2">
                      <input
                        type="checkbox"
                        checked={formData.amenities.includes(amenity)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setFormData({ ...formData, amenities: [...formData.amenities, amenity] })
                          } else {
                            setFormData({ ...formData, amenities: formData.amenities.filter(a => a !== amenity) })
                          }
                        }}
                        className="rounded border-gray-300 text-primary-600 focus:ring-primary-500"
                      />
                      <span className="text-sm text-gray-700">{amenity}</span>
                    </label>
                  ))}
                </div>
              </div>

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Property Images ({imagePreviews.length}/4)
                </label>
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
                  {imagePreviews.map((preview, index) => (
                    <div key={index} className="relative">
                      <img
                        src={preview}
                        alt={`Preview ${index + 1}`}
                        className="w-full h-32 object-cover rounded-lg"
                      />
                      <button
                        type="button"
                        onClick={() => removeImage(index)}
                        className="absolute top-2 right-2 bg-red-600 text-white p-1 rounded-full hover:bg-red-700"
                      >
                        <X className="h-4 w-4" />
                      </button>
                    </div>
                  ))}
                </div>
                {imagePreviews.length < 4 && (
                  <label className="flex items-center justify-center gap-2 px-4 py-2 border-2 border-dashed border-gray-300 rounded-lg hover:border-primary-500 cursor-pointer transition-colors">
                    <Upload className="h-5 w-5 text-gray-400" />
                    <span className="text-sm text-gray-600">Add More Images</span>
                    <input
                      type="file"
                      accept="image/*"
                      multiple
                      onChange={handleFileSelect}
                      className="hidden"
                    />
                  </label>
                )}
              </div>
            </div>

            <div className="flex gap-4 pt-4">
              <button
                type="button"
                onClick={() => navigate('/my-listings')}
                disabled={loading}
                className="flex-1 px-6 py-3 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition-all font-semibold disabled:opacity-50"
              >
                Cancel
              </button>
              <button
                type="submit"
                disabled={loading || uploadingImages}
                className="flex-1 px-6 py-3 bg-gradient-to-r from-primary-600 to-primary-700 text-white rounded-lg hover:shadow-lg transition-all font-semibold disabled:opacity-50 flex items-center justify-center gap-2"
              >
                {loading ? (
                  <>
                    <div className="animate-spin rounded-full h-5 w-5 border-2 border-white border-t-transparent"></div>
                    <span>Updating...</span>
                  </>
                ) : (
                  'Update Property'
                )}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}
