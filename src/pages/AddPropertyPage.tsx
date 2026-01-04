import { useState, useRef, useEffect } from 'react'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { Home, Upload, X, Camera, Video, Youtube, Instagram, MessageCircle } from 'lucide-react'
import { VizagLocality } from '../types'
import { AuthModal } from '../components/AuthModal'

export function AddPropertyPage() {
  const { user, profile } = useAuth()
  const [loading, setLoading] = useState(false)
  const [showAuthModal, setShowAuthModal] = useState(false)
  const [uploadingImages, setUploadingImages] = useState(false)
  const [selectedFiles, setSelectedFiles] = useState<File[]>([])
  const [imagePreviews, setImagePreviews] = useState<string[]>([])
  const [selectedVideos, setSelectedVideos] = useState<File[]>([])
  const [videoPreviews, setVideoPreviews] = useState<string[]>([])
  const [youtubeLinks, setYoutubeLinks] = useState<string[]>([''])
  const [instagramLinks, setInstagramLinks] = useState<string[]>([''])
  const [showCamera, setShowCamera] = useState(false)
  const [localities, setLocalities] = useState<VizagLocality[]>([])
  const [locality, setLocality] = useState('')
  const [localitySlug, setLocalitySlug] = useState('')
  const [showLocalityDropdown, setShowLocalityDropdown] = useState(false)
  const localityDropdownRef = useRef<HTMLDivElement>(null)
  const videoRef = useRef<HTMLVideoElement>(null)
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const streamRef = useRef<MediaStream | null>(null)
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    property_type: 'apartment',
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

  useEffect(() => {
    if (!user) return

    const fetchLocalities = async () => {
      const { data, error } = await supabase
        .from('localities')
        .select('id, name, slug')
        .eq('city', 'Visakhapatnam')
        .order('name', { ascending: true })

      if (!error && data) {
        setLocalities(data as any)
      } else {
        console.error('Failed to load localities', error)
      }
    }

    fetchLocalities()
  }, [user])

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (localityDropdownRef.current && !localityDropdownRef.current.contains(event.target as Node)) {
        setShowLocalityDropdown(false)
      }
    }

    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  const propertyTypes = [
    'apartment',
    'villa',
    'plot',
    'commercial',
    'penthouse',
    'farmhouse',
    'pg',
    'hostel',
    'flatmates',
    'office',
    'shop',
    'warehouse',
    'coworking'
  ]
  const commonAmenities = ['Parking', 'Gym', 'Swimming Pool', 'Security', 'Power Backup', 'Elevator', 'Garden', 'Club House', 'WiFi', 'Furnished']

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files || [])
    if (files.length === 0) return

    const imageFiles = files.filter(file => file.type.startsWith('image/'))
    if (imageFiles.length === 0) {
      alert('Please select valid image files')
      return
    }

    const maxSize = 10 * 1024 * 1024
    const oversizedFiles = imageFiles.filter(file => file.size > maxSize)
    if (oversizedFiles.length > 0) {
      alert('Some files are too large. Maximum size is 10MB per image.')
      return
    }

    setSelectedFiles(prev => [...prev, ...imageFiles])

    imageFiles.forEach(file => {
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

  const handleVideoSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files || [])
    if (files.length === 0) return

    const videoFiles = files.filter(file => file.type.startsWith('video/'))
    if (videoFiles.length === 0) {
      alert('Please select valid video files')
      return
    }

    const maxSize = 100 * 1024 * 1024
    const oversizedFiles = videoFiles.filter(file => file.size > maxSize)
    if (oversizedFiles.length > 0) {
      alert('Some videos are too large. Maximum size is 100MB per video.')
      return
    }

    setSelectedVideos(prev => [...prev, ...videoFiles])

    videoFiles.forEach(file => {
      const url = URL.createObjectURL(file)
      setVideoPreviews(prev => [...prev, url])
    })
  }

  const removeVideo = (index: number) => {
    URL.revokeObjectURL(videoPreviews[index])
    setSelectedVideos(prev => prev.filter((_, i) => i !== index))
    setVideoPreviews(prev => prev.filter((_, i) => i !== index))
  }

  const addYoutubeLink = () => {
    setYoutubeLinks(prev => [...prev, ''])
  }

  const updateYoutubeLink = (index: number, value: string) => {
    setYoutubeLinks(prev => prev.map((link, i) => i === index ? value : link))
  }

  const removeYoutubeLink = (index: number) => {
    setYoutubeLinks(prev => prev.filter((_, i) => i !== index))
  }

  const addInstagramLink = () => {
    setInstagramLinks(prev => [...prev, ''])
  }

  const updateInstagramLink = (index: number, value: string) => {
    setInstagramLinks(prev => prev.map((link, i) => i === index ? value : link))
  }

  const removeInstagramLink = (index: number) => {
    setInstagramLinks(prev => prev.filter((_, i) => i !== index))
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

  const uploadVideos = async (propertyId: string): Promise<void> => {
    if (selectedVideos.length === 0) return

    try {
      for (const file of selectedVideos) {
        const fileExt = file.name.split('.').pop()
        const fileName = `${user!.id}/${Date.now()}-${Math.random().toString(36).substring(7)}.${fileExt}`

        const { error: uploadError } = await supabase.storage
          .from('property-videos')
          .upload(fileName, file)

        if (uploadError) throw uploadError

        const { data: { publicUrl } } = supabase.storage
          .from('property-videos')
          .getPublicUrl(fileName)

        await supabase.from('property_videos').insert({
          property_id: propertyId,
          video_url: publicUrl
        })
      }
    } catch (error: any) {
      console.error('Error uploading videos:', error)
      throw new Error('Failed to upload videos: ' + error.message)
    }
  }

  const extractYoutubeId = (url: string): string | null => {
    const patterns = [
      /(?:youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/embed\/)([^&\n?#]+)/,
      /^([a-zA-Z0-9_-]{11})$/
    ]
    for (const pattern of patterns) {
      const match = url.match(pattern)
      if (match) return match[1]
    }
    return null
  }

  const extractInstagramCode = (url: string): string | null => {
    const patterns = [
      /instagram\.com\/(?:p|reel)\/([^\/\?]+)/,
      /instagram\.com\/tv\/([^\/\?]+)/
    ]
    for (const pattern of patterns) {
      const match = url.match(pattern)
      if (match) return match[1]
    }
    return null
  }

  const saveSocialLinks = async (propertyId: string): Promise<void> => {
    const validYoutubeLinks = youtubeLinks.filter(link => link.trim() !== '')
    const validInstagramLinks = instagramLinks.filter(link => link.trim() !== '')

    try {
      for (const link of validYoutubeLinks) {
        const embedCode = extractYoutubeId(link)
        await supabase.from('property_social_links').insert({
          property_id: propertyId,
          platform: 'youtube',
          link_url: link,
          embed_code: embedCode
        })
      }

      for (const link of validInstagramLinks) {
        const embedCode = extractInstagramCode(link)
        await supabase.from('property_social_links').insert({
          property_id: propertyId,
          platform: 'instagram',
          link_url: link,
          embed_code: embedCode
        })
      }
    } catch (error: any) {
      console.error('Error saving social links:', error)
      throw new Error('Failed to save social media links: ' + error.message)
    }
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!user) return

    if (selectedFiles.length === 0) {
      alert('Please add at least one property image')
      return
    }

    if (!locality || !localitySlug) {
      alert('Please select a locality from the dropdown')
      return
    }

    setLoading(true)
    try {
      stopCamera()

      const imageUrls = await uploadImages()

      const { data: propertyData, error } = await supabase
        .from('properties')
        .insert({
          title: formData.title,
          description: formData.description,
          property_type: formData.property_type,
          listing_type: formData.listing_type,
          price: parseFloat(formData.price),
          bedrooms: parseInt(formData.bedrooms),
          bathrooms: parseInt(formData.bathrooms),
          area_sqft: parseInt(formData.area_sqft),
          locality_slug: localitySlug,
          state: formData.state,
          pincode: formData.pincode || null,
          amenities: formData.amenities,
          agent_name: formData.agent_name,
          agent_phone: formData.agent_phone,
          agent_whatsapp: formData.agent_whatsapp || null,
          owner_id: user.id,
          images: imageUrls
        })
        .select()
        .single()

      if (error) throw error

      if (propertyData) {
        await uploadVideos(propertyData.id)
        await saveSocialLinks(propertyData.id)
      }

      alert('Property listed successfully!')
      window.location.href = '/dashboard'
    } catch (error: any) {
      console.error('Error adding property:', error)
      alert(error.message || 'Failed to add property')
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

  if (!user) {
    return (
      <>
        {showAuthModal && (
          <AuthModal
            onClose={() => setShowAuthModal(false)}
            intentRole="owner"
            redirectTo="/add-property"
          />
        )}
        <div className="min-h-screen bg-gradient-to-br from-primary-50 to-blue-50 flex items-center justify-center px-4">
          <div className="max-w-md w-full bg-white rounded-2xl shadow-xl p-8 text-center">
            <div className="mb-6">
              <div className="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-yellow-400 to-orange-500 rounded-full mb-4">
                <Home className="h-8 w-8 text-gray-900" />
              </div>
              <h2 className="text-3xl font-bold text-gray-900 mb-2">Post Your Property — Free</h2>
              <p className="text-gray-600 mb-6">Register now to list your property and reach thousands of buyers</p>
            </div>

            <div className="space-y-4 mb-6">
              <div className="flex items-center justify-center gap-2 text-sm text-gray-600">
                <span className="inline-block w-2 h-2 bg-green-500 rounded-full"></span>
                <span>Verified listings</span>
              </div>
              <div className="flex items-center justify-center gap-2 text-sm text-gray-600">
                <span className="inline-block w-2 h-2 bg-green-500 rounded-full"></span>
                <span>AI-powered property matching</span>
              </div>
              <div className="flex items-center justify-center gap-2 text-sm text-gray-600">
                <span className="inline-block w-2 h-2 bg-green-500 rounded-full"></span>
                <span>Transparent pricing</span>
              </div>
            </div>

            <div className="space-y-3">
              <button
                onClick={() => setShowAuthModal(true)}
                className="block w-full bg-gradient-to-r from-yellow-400 to-orange-500 text-gray-900 px-6 py-3 rounded-full hover:from-yellow-500 hover:to-orange-600 transition-all font-bold shadow-lg hover:shadow-xl"
              >
                Login with Mobile OTP
              </button>
              <p className="text-sm text-gray-600">
                We never spam. OTP based secure login.
              </p>
            </div>
          </div>
        </div>
      </>
    )
  }

  if (profile && profile.role !== 'owner' && profile.role !== 'both') {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Upgrade Your Account</h2>
          <p className="text-gray-600 mb-4">To post properties, you need to upgrade to an owner account</p>
          <button
            onClick={async () => {
              await supabase.rpc('upgrade_user_role', { user_id: user!.id, new_role: 'owner' })
              window.location.reload()
            }}
            className="bg-primary-600 text-white px-6 py-3 rounded-full hover:bg-primary-700 transition-colors font-semibold"
          >
            Upgrade to Owner Account
          </button>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-4xl mx-auto px-4">
        <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-8">
          <div className="flex items-center space-x-3 mb-6">
            <Home className="h-8 w-8 text-primary-600" />
            <h1 className="text-3xl font-bold text-gray-900">List Your Property</h1>
          </div>

          <div className="mb-8 p-6 bg-gradient-to-r from-green-50 to-emerald-50 rounded-xl border-2 border-green-200">
            <div className="flex flex-col md:flex-row items-center justify-between gap-4">
              <div className="flex-1">
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Prefer WhatsApp? List via WhatsApp!</h3>
                <p className="text-sm text-gray-600">Share property details directly on WhatsApp and our team will list it for you within 24 hours.</p>
              </div>
              <a
                href="https://wa.me/917207550499?text=Hi%20Vizag%20Property%20Experts%2C%20I%20want%20to%20post%20my%20property%20in%20Vizag."
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 bg-green-600 text-white px-6 py-3 rounded-full hover:bg-green-700 transition-all font-semibold shadow-lg whitespace-nowrap"
              >
                <MessageCircle className="h-5 w-5" />
                <span>Post Property via WhatsApp</span>
              </a>
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
                  Property Title
                </label>
                <input
                  type="text"
                  required
                  value={formData.title}
                  onChange={(e) => setFormData({ ...formData, title: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="e.g., Spacious 2BHK Apartment in Whitefield"
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
                  Property Type
                </label>
                <select
                  required
                  value={formData.property_type}
                  onChange={(e) => setFormData({ ...formData, property_type: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                >
                  {propertyTypes.map(type => (
                    <option key={type} value={type} className="capitalize">
                      {type}
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
                  <option value="sale">Sale</option>
                  <option value="rent">Rent</option>
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
                  min="0"
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
                  min="0"
                />
              </div>

              <div className="md:col-span-2 relative" ref={localityDropdownRef}>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Locality <span className="text-red-500">*</span>
                </label>

                <input
                  type="text"
                  value={locality}
                  onChange={(e) => {
                    setLocality(e.target.value)
                    setLocalitySlug('')
                    setShowLocalityDropdown(e.target.value.length >= 3)
                  }}
                  onFocus={() => setShowLocalityDropdown(locality.length >= 3)}
                  placeholder="Start typing locality name (min 3 letters)"
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  autoComplete="off"
                />

                {showLocalityDropdown && locality.length >= 3 && (
                  <div className="absolute z-10 w-full mt-1 bg-white border border-gray-300 rounded-lg shadow-lg max-h-60 overflow-y-auto">
                    {localities
                      .filter(loc =>
                        (loc as any).name.toLowerCase().startsWith(locality.toLowerCase())
                      )
                      .map(loc => (
                        <div
                          key={loc.id}
                          onClick={() => {
                            setLocality((loc as any).name)
                            setLocalitySlug((loc as any).slug)
                            setShowLocalityDropdown(false)
                          }}
                          className="px-4 py-3 hover:bg-primary-50 cursor-pointer transition-colors border-b border-gray-100 last:border-b-0"
                        >
                          <div className="font-medium text-gray-900">{(loc as any).name}</div>
                        </div>
                      ))}
                    {localities.filter(loc =>
                      (loc as any).name.toLowerCase().startsWith(locality.toLowerCase())
                    ).length === 0 && (
                      <div className="px-4 py-3 text-gray-500 text-sm">
                        No localities found starting with "{locality}"
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
                  onChange={(e) => setFormData({ ...formData, pincode: e.target.value })}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="560066"
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
                  Property Images
                </label>
                <div className="space-y-4">
                  <div className="flex gap-2">
                    <label className="flex-1 flex flex-col items-center justify-center h-32 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer bg-gray-50 hover:bg-gray-100 transition-colors">
                      <div className="flex flex-col items-center justify-center pt-5 pb-6">
                        <Upload className="h-10 w-10 text-gray-400 mb-2" />
                        <p className="text-sm text-gray-500 font-semibold">Upload Images</p>
                        <p className="text-xs text-gray-500">PNG, JPG (MAX. 10MB)</p>
                      </div>
                      <input
                        type="file"
                        className="hidden"
                        accept="image/*"
                        multiple
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

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Property Videos (Optional)
                </label>
                <div className="space-y-4">
                  <div className="flex items-center justify-center w-full">
                    <label className="flex flex-col items-center justify-center w-full h-32 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer bg-gray-50 hover:bg-gray-100 transition-colors">
                      <div className="flex flex-col items-center justify-center pt-5 pb-6">
                        <Video className="h-10 w-10 text-gray-400 mb-2" />
                        <p className="mb-2 text-sm text-gray-500">
                          <span className="font-semibold">Click to upload videos</span>
                        </p>
                        <p className="text-xs text-gray-500">MP4, WebM, MOV (MAX. 100MB each)</p>
                      </div>
                      <input
                        type="file"
                        className="hidden"
                        accept="video/*"
                        multiple
                        onChange={handleVideoSelect}
                      />
                    </label>
                  </div>

                  {videoPreviews.length > 0 && (
                    <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
                      {videoPreviews.map((preview, index) => (
                        <div key={index} className="relative group">
                          <video
                            src={preview}
                            className="w-full h-32 object-cover rounded-lg border border-gray-200"
                            controls
                          />
                          <button
                            type="button"
                            onClick={() => removeVideo(index)}
                            className="absolute top-2 right-2 p-1 bg-red-500 text-white rounded-full opacity-0 group-hover:opacity-100 transition-opacity hover:bg-red-600"
                          >
                            <X className="h-4 w-4" />
                          </button>
                        </div>
                      ))}
                    </div>
                  )}

                  {selectedVideos.length > 0 && (
                    <p className="text-sm text-gray-600">
                      {selectedVideos.length} video{selectedVideos.length > 1 ? 's' : ''} selected
                    </p>
                  )}
                </div>
              </div>

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  YouTube Videos (Optional)
                </label>
                <div className="space-y-2">
                  {youtubeLinks.map((link, index) => (
                    <div key={index} className="flex gap-2">
                      <div className="flex-1 relative">
                        <Youtube className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-400" />
                        <input
                          type="url"
                          value={link}
                          onChange={(e) => updateYoutubeLink(index, e.target.value)}
                          placeholder="https://www.youtube.com/watch?v=..."
                          className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                        />
                      </div>
                      {youtubeLinks.length > 1 && (
                        <button
                          type="button"
                          onClick={() => removeYoutubeLink(index)}
                          className="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-colors"
                        >
                          <X className="h-5 w-5" />
                        </button>
                      )}
                    </div>
                  ))}
                  <button
                    type="button"
                    onClick={addYoutubeLink}
                    className="text-sm text-primary-600 hover:text-primary-700 font-medium"
                  >
                    + Add another YouTube link
                  </button>
                </div>
              </div>

              <div className="md:col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Instagram Videos (Optional)
                </label>
                <div className="space-y-2">
                  {instagramLinks.map((link, index) => (
                    <div key={index} className="flex gap-2">
                      <div className="flex-1 relative">
                        <Instagram className="absolute left-3 top-1/2 transform -translate-y-1/2 h-5 w-5 text-gray-400" />
                        <input
                          type="url"
                          value={link}
                          onChange={(e) => updateInstagramLink(index, e.target.value)}
                          placeholder="https://www.instagram.com/p/... or /reel/..."
                          className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                        />
                      </div>
                      {instagramLinks.length > 1 && (
                        <button
                          type="button"
                          onClick={() => removeInstagramLink(index)}
                          className="p-2 text-red-500 hover:bg-red-50 rounded-lg transition-colors"
                        >
                          <X className="h-5 w-5" />
                        </button>
                      )}
                    </div>
                  ))}
                  <button
                    type="button"
                    onClick={addInstagramLink}
                    className="text-sm text-primary-600 hover:text-primary-700 font-medium"
                  >
                    + Add another Instagram link
                  </button>
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
  )
}
