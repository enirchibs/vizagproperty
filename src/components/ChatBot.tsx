import { useState, useEffect, useRef } from 'react'
import { MessageCircle, X, Send, Mic, MicOff, MapPin, Bed, Bath, Maximize, Minimize2, Maximize2 } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'
import { ChatMessage, Property } from '../types'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { useNavigate, useLocation } from 'react-router-dom'

interface ChatMessageWithProperties extends ChatMessage {
  properties?: Property[]
}

interface ChatBotProps {
  externalTrigger?: number
}

export function ChatBot({ externalTrigger }: ChatBotProps = {}) {
  const { user } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  
  const hideOnRoutes = ['/add-property', '/post-property', '/search', '/mobile-search']

  if (hideOnRoutes.includes(location.pathname)) {
    return null
  }

  const [isOpen, setIsOpen] = useState(false)
  const [isMinimized, setIsMinimized] = useState(false)
  const [isMaximized, setIsMaximized] = useState(false)
  const [messages, setMessages] = useState<ChatMessageWithProperties[]>([])

  const [input, setInput] = useState('')
  const [loading, setLoading] = useState(false)
  const [sessionId] = useState(() => crypto.randomUUID())
  const messagesEndRef = useRef<HTMLDivElement>(null)
  const { isListening, transcript, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()

  useEffect(() => {
    if (transcript) {
      setInput(transcript)
    }
  }, [transcript])

  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [messages])

  useEffect(() => {
    if (externalTrigger && externalTrigger > 0) {
      setIsOpen(true)
    }
  }, [externalTrigger])

  const handleSend = async (messageText?: string) => {
    const textToSend = messageText || input.trim()
    if (!textToSend || loading) return

    const userMessage: ChatMessage = {
      id: crypto.randomUUID(),
      user_id: user?.id,
      session_id: sessionId,
      role: 'user',
      message: textToSend,
      created_at: new Date().toISOString()
    }

    setMessages(prev => [...prev, userMessage])
    setInput('')
    resetTranscript()
    setLoading(true)

    try {
      await supabase.from('chat_messages').insert({
        user_id: user?.id,
        session_id: sessionId,
        role: 'user',
        message: userMessage.message
      })

      const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/chat`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          message: userMessage.message,
          session_id: sessionId
        })
      })

      const data = await response.json()

      const assistantMessage: ChatMessageWithProperties = {
        id: crypto.randomUUID(),
        user_id: user?.id,
        session_id: sessionId,
        role: 'assistant',
        message: data.response || 'I apologize, but I encountered an error. Please try again.',
        properties: data.properties || [],
        created_at: new Date().toISOString()
      }

      setMessages(prev => [...prev, assistantMessage])

      await supabase.from('chat_messages').insert({
        user_id: user?.id,
        session_id: sessionId,
        role: 'assistant',
        message: assistantMessage.message
      })
    } catch (error) {
      const errorMessage: ChatMessageWithProperties = {
        id: crypto.randomUUID(),
        user_id: user?.id,
        session_id: sessionId,
        role: 'assistant',
        message: 'I can help you find properties! Try asking me about available properties in a specific area or with certain features.',
        created_at: new Date().toISOString()
      }
      setMessages(prev => [...prev, errorMessage])
    } finally {
      setLoading(false)
    }
  }

  const formatPrice = (price: number) => {
    if (price >= 10000000) {
      return `₹${(price / 10000000).toFixed(2)} Cr`
    }
    return `₹${(price / 100000).toFixed(2)} L`
  }

  const handlePropertyClick = (propertyId: string) => {
    setIsOpen(false)
    navigate(`/property/${propertyId}`)
  }

  const handleVoiceToggle = () => {
    if (isListening) {
      stopListening()
    } else {
      startListening()
    }
  }

  const suggestions = [
    "Plots in Madhurawada under 30L",
    "VMRDA approved plots in Vizag",
    "Flats near IT SEZ Vizag",
    "Best areas to invest in Vizag"
  ]

  const handleSuggestionClick = (suggestion: string) => {
    handleSend(suggestion)
  }

  return (
    <>
      {!isOpen && (
        <button
          onClick={() => setIsOpen(true)}
          className="fixed bottom-24 right-4 md:bottom-6 md:right-24 bg-primary-600 text-white p-4 rounded-full shadow-2xl hover:bg-primary-700 transition-all hover:scale-110 z-40 min-h-[56px] min-w-[56px] flex items-center justify-center"
          aria-label="Open AI Chat Assistant"
        >
          <MessageCircle className="h-6 w-6" />
        </button>
      )}

      {isOpen && !isMinimized && (
        <div className={`fixed ${
          isMaximized
            ? 'inset-0 md:inset-4 rounded-none md:rounded-2xl'
            : 'inset-x-4 bottom-4 top-20 md:inset-auto md:bottom-6 md:right-6 md:w-[420px] md:h-[600px] md:top-auto md:left-auto rounded-2xl'
        } bg-white shadow-2xl flex flex-col z-50 animate-slide-up border border-gray-200`}>
          <div className="bg-primary-600 text-white p-3 md:p-4 rounded-t-2xl flex items-center justify-between">
            <div>
              <h3 className="font-semibold text-sm md:text-base">VizagProperty Assistant</h3>
              <p className="text-xs text-primary-100">Ask me anything about properties</p>
            </div>
            <div className="flex items-center gap-1">
              <button
                onClick={() => setIsMaximized(!isMaximized)}
                className="text-white hover:bg-primary-700 p-1 rounded-lg transition-colors"
                title={isMaximized ? "Restore" : "Maximize"}
              >
                {isMaximized ? <Minimize2 className="h-4 w-4 md:h-5 md:w-5" /> : <Maximize2 className="h-4 w-4 md:h-5 md:w-5" />}
              </button>
              <button
                onClick={() => setIsMinimized(true)}
                className="text-white hover:bg-primary-700 p-1 rounded-lg transition-colors hidden md:block"
                title="Minimize"
              >
                <Minimize2 className="h-5 w-5" />
              </button>
              <button
                onClick={() => setIsOpen(false)}
                className="text-white hover:bg-primary-700 p-1 rounded-lg transition-colors"
                title="Close"
              >
                <X className="h-4 w-4 md:h-5 md:w-5" />
              </button>
            </div>
          </div>

          <div className="flex-1 overflow-y-auto p-4 space-y-4">
            {messages.length === 0 && (
              <div className="text-center text-gray-500 mt-8 px-4">
                <MessageCircle className="h-12 w-12 mx-auto mb-3 text-primary-300" />
                <p className="text-sm font-semibold text-gray-700">VizagProperty Expert</p>
                <p className="text-xs mt-2 text-gray-600">Your local Vizag real estate assistant</p>
                <div className="mt-4 space-y-2">
                  <p className="text-xs font-medium text-primary-700 mb-3">Quick searches:</p>
                  {suggestions.map((suggestion, index) => (
                    <button
                      key={index}
                      onClick={() => handleSuggestionClick(suggestion)}
                      className="w-full text-left px-4 py-2.5 bg-white border-2 border-primary-200 rounded-lg hover:border-primary-400 hover:bg-primary-50 transition-all text-sm text-gray-700 hover:text-primary-700 font-medium group"
                    >
                      <span className="group-hover:translate-x-1 inline-block transition-transform">
                        {suggestion}
                      </span>
                    </button>
                  ))}
                </div>
                <p className="text-[10px] text-gray-500 mt-4">
                  Click suggestions or type your own query
                </p>
              </div>
            )}

            {messages.map((msg) => (
              <div key={msg.id}>
                <div className={`flex ${msg.role === 'user' ? 'justify-end' : 'justify-start'}`}>
                  <div
                    className={`max-w-[80%] p-3 rounded-2xl ${
                      msg.role === 'user'
                        ? 'bg-primary-600 text-white rounded-br-none'
                        : 'bg-gray-100 text-gray-900 rounded-bl-none'
                    }`}
                  >
                    <p className="text-sm whitespace-pre-wrap">{msg.message}</p>
                  </div>
                </div>

                {msg.properties && msg.properties.length > 0 && (
                  <div className="mt-3 space-y-2">
                    {msg.properties.map((property) => (
                      <div
                        key={property.id}
                        onClick={() => handlePropertyClick(property.id)}
                        className="bg-gradient-to-r from-white to-primary-50 border-2 border-primary-200 rounded-lg overflow-hidden hover:shadow-xl hover:border-primary-400 transition-all cursor-pointer group"
                      >
                        <div className="flex">
                          <div className="relative w-24 h-24">
                            <img
                              src={property.images?.[0] || 'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg'}
                              alt={`Property for sale in ${property.location} - ${property.title}`}
                              className="w-full h-full object-cover"
                            />
                            <div className="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-20 transition-opacity flex items-center justify-center">
                              <span className="text-white opacity-0 group-hover:opacity-100 text-xs font-semibold">View</span>
                            </div>
                          </div>
                          <div className="flex-1 p-2.5">
                            <h4 className="font-bold text-sm text-gray-900 line-clamp-1 group-hover:text-primary-600 transition-colors">
                              {property.title}
                            </h4>
                            <div className="flex items-center gap-1 text-xs text-gray-600 mt-0.5">
                              <MapPin className="h-3 w-3 flex-shrink-0" />
                              <span className="line-clamp-1">{property.location}</span>
                            </div>
                            <div className="flex items-center gap-2.5 mt-1 text-xs text-gray-600">
                              <span className="flex items-center gap-0.5">
                                <Bed className="h-3 w-3" />
                                {property.bedrooms}
                              </span>
                              <span className="flex items-center gap-0.5">
                                <Bath className="h-3 w-3" />
                                {property.bathrooms}
                              </span>
                              <span className="flex items-center gap-0.5">
                                <Maximize className="h-3 w-3" />
                                {property.area_sqft}
                              </span>
                            </div>
                            <div className="mt-1.5 flex items-center justify-between">
                              <span className="font-bold text-primary-600 text-sm">
                                {formatPrice(property.price)}
                              </span>
                              <span className="text-[10px] text-primary-600 font-medium group-hover:underline">
                                View Details →
                              </span>
                            </div>
                          </div>
                        </div>
                      </div>
                    ))}
                    <div className="mt-2 p-2 bg-primary-50 border border-primary-200 rounded-lg text-center">
                      <p className="text-xs text-primary-700 font-medium">
                        💡 Tap any property for photos, videos & voice tours
                      </p>
                    </div>
                  </div>
                )}
              </div>
            ))}

            {loading && (
              <div className="flex justify-start">
                <div className="bg-gray-100 text-gray-900 p-3 rounded-2xl rounded-bl-none">
                  <div className="flex space-x-2">
                    <div className="w-2 h-2 bg-gray-400 rounded-full animate-bounce"></div>
                    <div className="w-2 h-2 bg-gray-400 rounded-full animate-bounce" style={{ animationDelay: '0.1s' }}></div>
                    <div className="w-2 h-2 bg-gray-400 rounded-full animate-bounce" style={{ animationDelay: '0.2s' }}></div>
                  </div>
                </div>
              </div>
            )}

            <div ref={messagesEndRef} />
          </div>

          <div className="p-3 md:p-4 border-t border-gray-200 bg-gray-50">
            {messages.length > 0 && (
              <div className="mb-2 flex flex-wrap gap-1.5 overflow-x-auto pb-1">
                {suggestions.map((suggestion, index) => (
                  <button
                    key={index}
                    onClick={() => handleSuggestionClick(suggestion)}
                    className="px-3 py-1.5 bg-white border border-primary-300 rounded-full text-xs text-primary-700 hover:bg-primary-50 hover:border-primary-500 transition-all whitespace-nowrap font-medium"
                  >
                    {suggestion}
                  </button>
                ))}
              </div>
            )}
            {isListening && (
              <div className="mb-2 text-center text-sm text-primary-600 animate-pulse font-medium">
                Listening...
              </div>
            )}
            <div className="flex items-center space-x-2">
              <input
                type="text"
                value={input}
                onChange={(e) => setInput(e.target.value)}
                onKeyPress={(e) => {
                  if (e.key === 'Enter' && !loading) {
                    handleSend()
                  }
                }}
                placeholder="Ask about Vizag properties..."
                className="flex-1 px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent text-base min-h-[44px]"
                disabled={loading}
              />
              {isSupported && (
                <button
                  onClick={handleVoiceToggle}
                  className={`p-3 rounded-lg transition-colors min-h-[44px] min-w-[44px] flex items-center justify-center ${
                    isListening
                      ? 'bg-red-600 text-white hover:bg-red-700'
                      : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                  }`}
                  aria-label={isListening ? "Stop listening" : "Start voice input"}
                >
                  {isListening ? <MicOff className="h-5 w-5" /> : <Mic className="h-5 w-5" />}
                </button>
              )}
              <button
                onClick={() => handleSend()}
                disabled={loading || !input.trim()}
                className="bg-primary-600 text-white p-3 rounded-lg hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed min-h-[44px] min-w-[44px] flex items-center justify-center"
                aria-label="Send message"
              >
                <Send className="h-5 w-5" />
              </button>
            </div>
          </div>
        </div>
      )}

      {isOpen && isMinimized && (
        <div className="fixed bottom-6 right-6 bg-primary-600 text-white rounded-lg shadow-2xl flex items-center gap-3 px-4 py-3 z-50 cursor-pointer hover:bg-primary-700 transition-all"
          onClick={() => setIsMinimized(false)}>
          <MessageCircle className="h-5 w-5" />
          <div>
            <h4 className="font-semibold text-sm">VizagProperty Assistant</h4>
            <p className="text-xs text-primary-100">Click to expand</p>
          </div>
          <button
            onClick={(e) => {
              e.stopPropagation()
              setIsOpen(false)
              setIsMinimized(false)
            }}
            className="text-white hover:bg-primary-800 p-1 rounded-lg transition-colors ml-2"
          >
            <X className="h-4 w-4" />
          </button>
        </div>
      )}
    </>
  )
}
