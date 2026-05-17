import { useState, useEffect } from 'react'
import { ChevronLeft, ChevronRight, Image as ImageIcon, Video, Youtube, Instagram } from 'lucide-react'
import { supabase } from '../lib/supabase'

interface MediaItem {
  type: 'image' | 'video' | 'youtube' | 'instagram'
  url: string
  embedCode?: string
}

interface MediaGalleryProps {
  images: string[]
  propertyId: string
  propertyTitle?: string
  propertyLocation?: string
}

export function MediaGallery({ images, propertyId, propertyTitle = 'Property', propertyLocation = 'Vizag' }: MediaGalleryProps) {
  const [mediaItems, setMediaItems] = useState<MediaItem[]>([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    let mounted = true

    const loadMedia = async () => {
      try {
        const items: MediaItem[] = images.map(url => ({
          type: 'image',
          url
        }))

        const [videosResult, socialLinksResult] = await Promise.all([
          supabase
            .from('property_videos')
            .select('video_url')
            .eq('property_id', propertyId),
          supabase
            .from('property_social_links')
            .select('platform, link_url, embed_code')
            .eq('property_id', propertyId)
        ])

        if (!mounted) return

        if (videosResult.data) {
          videosResult.data.forEach(video => {
            items.push({
              type: 'video',
              url: video.video_url
            })
          })
        }

        if (socialLinksResult.data) {
          socialLinksResult.data.forEach(link => {
            items.push({
              type: link.platform as 'youtube' | 'instagram',
              url: link.link_url,
              embedCode: link.embed_code || undefined
            })
          })
        }

        if (mounted) {
          setMediaItems(items)
        }
      } catch (error) {
        if (mounted) {
          setMediaItems(images.map(url => ({ type: 'image', url })))
        }
      } finally {
        if (mounted) {
          setLoading(false)
        }
      }
    }

    loadMedia()

    return () => {
      mounted = false
    }
  }, [propertyId, images])

  const goToPrevious = () => {
    setCurrentIndex(prev => (prev === 0 ? mediaItems.length - 1 : prev - 1))
  }

  const goToNext = () => {
    setCurrentIndex(prev => (prev === mediaItems.length - 1 ? 0 : prev + 1))
  }

  if (loading || mediaItems.length === 0) {
    return (
      <div className="relative h-96 bg-gray-900 rounded-2xl overflow-hidden">
        <div className="w-full h-full flex items-center justify-center">
          <div className="text-white">Loading...</div>
        </div>
      </div>
    )
  }

  const currentMedia = mediaItems[currentIndex]

  const renderMedia = () => {
    switch (currentMedia.type) {
      case 'image':
        return (
          <img
            src={currentMedia.url}
            alt={`Property for sale in ${propertyLocation} - ${propertyTitle}`}
            className="w-full h-full object-cover"
          />
        )

      case 'video':
        return (
          <video
            src={currentMedia.url}
            controls
            className="w-full h-full object-cover"
          />
        )

      case 'youtube':
        if (!currentMedia.embedCode) return null
        return (
          <iframe
            src={`https://www.youtube.com/embed/${currentMedia.embedCode}`}
            title="YouTube video"
            className="w-full h-full"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowFullScreen
          />
        )

      case 'instagram':
        if (!currentMedia.embedCode) return null
        return (
          <div className="w-full h-full flex items-center justify-center bg-black">
            <iframe
              src={`https://www.instagram.com/p/${currentMedia.embedCode}/embed`}
              className="w-full max-w-md h-full"
              frameBorder="0"
              scrolling="no"
              allowTransparency
            />
          </div>
        )

      default:
        return null
    }
  }

  const getMediaIcon = (type: string) => {
    switch (type) {
      case 'image':
        return <ImageIcon className="h-4 w-4" />
      case 'video':
        return <Video className="h-4 w-4" />
      case 'youtube':
        return <Youtube className="h-4 w-4" />
      case 'instagram':
        return <Instagram className="h-4 w-4" />
      default:
        return null
    }
  }

  return (
    <div className="relative h-96 bg-gray-900 rounded-2xl overflow-hidden">
      {renderMedia()}

      {mediaItems.length > 1 && (
        <>
          <button
            onClick={goToPrevious}
            className="absolute left-4 top-1/2 -translate-y-1/2 bg-white/90 p-2 rounded-full hover:bg-white transition-colors z-10"
          >
            <ChevronLeft className="h-6 w-6 text-gray-900" />
          </button>
          <button
            onClick={goToNext}
            className="absolute right-4 top-1/2 -translate-y-1/2 bg-white/90 p-2 rounded-full hover:bg-white transition-colors z-10"
          >
            <ChevronRight className="h-6 w-6 text-gray-900" />
          </button>

          <div className="absolute bottom-4 left-1/2 -translate-x-1/2 flex space-x-2 z-10">
            {mediaItems.map((item, index) => (
              <button
                key={index}
                onClick={() => setCurrentIndex(index)}
                className={`p-1.5 rounded-full transition-colors ${
                  index === currentIndex
                    ? 'bg-white text-gray-900'
                    : 'bg-white/50 text-white hover:bg-white/70'
                }`}
                title={item.type}
              >
                {getMediaIcon(item.type)}
              </button>
            ))}
          </div>

          <div className="absolute top-4 left-4 bg-black/50 text-white px-3 py-1 rounded-full text-sm">
            {currentIndex + 1} / {mediaItems.length}
          </div>
        </>
      )}
    </div>
  )
}
