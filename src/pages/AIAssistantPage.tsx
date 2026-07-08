import { useState, useEffect, useRef } from 'react'
import { MessageCircle, Send, Mic, MicOff, MapPin, ChevronLeft } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'
import { ChatMessage, Property } from '../types'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { useNavigate } from 'react-router-dom'

interface ChatMessageWithProperties extends ChatMessage {
  properties?: Property[]
}

export function AIAssistantPage() {
  const { user } = useAuth()
  const navigate = useNavigate()
  
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

  return (
    <div className="flex flex-col h-screen bg-gray-50">
      <header className="bg-white shadow-sm shrink-0">
        <div className="max-w-4xl mx-auto px-4 h-16 flex items-center gap-4">
          <button
            onClick={() => navigate('/')}
            className="p-2 -ml-2 hover:bg-gray-100 rounded-full transition-colors"
          >
            <ChevronLeft className="w-6 h-6 text-gray-600" />
          </button>
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center">
              <MessageCircle className="w-6 h-6" />
            </div>
            <div>
              <h1 className="font-bold text-gray-900 leading-tight">VizagProperty AI</h1>
              <p className="text-xs text-green-600 font-medium flex items-center gap-1">
                <span className="w-1.5 h-1.5 rounded-full bg-green-500 animate-pulse"></span>
                Online
              </p>
            </div>
          </div>
        </div>
      </header>

      <main className="flex-1 overflow-y-auto w-full max-w-4xl mx-auto p-4 flex flex-col gap-4">
        {messages.length === 0 && (
          <div className="flex-1 flex flex-col items-center justify-center text-center px-4 max-w-lg mx-auto w-full">
            <div className="w-20 h-20 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center mb-6 shadow-sm">
              <MessageCircle className="w-10 h-10" />
            </div>
            <h2 className="text-2xl font-bold text-gray-900 mb-2">Welcome to AI Search</h2>
            <p className="text-gray-600 mb-8">
              Describe your dream property naturally. I can help you find exact matches, suggest alternatives, and analyze locations.
            </p>
            
            <div className="w-full space-y-3">
              <p className="text-sm font-semibold text-gray-500 text-left mb-2">Try asking:</p>
              {suggestions.map((suggestion, index) => (
                <button
                  key={index}
                  onClick={() => handleSend(suggestion)}
                  className="w-full text-left px-5 py-4 bg-white border border-gray-200 rounded-xl hover:border-primary-400 hover:shadow-md transition-all text-gray-700 hover:text-primary-700 font-medium group flex justify-between items-center"
                >
                  <span>{suggestion}</span>
                  <span className="text-primary-400 opacity-0 group-hover:opacity-100 transition-opacity">→</span>
                </button>
              ))}
            </div>
          </div>
        )}

        {messages.map((msg) => (
          <div key={msg.id} className={`flex ${msg.role === 'user' ? 'justify-end' : 'justify-start'}`}>
            <div className="max-w-[85%]">
              <div
                className={`p-4 rounded-2xl ${
                  msg.role === 'user'
                    ? 'bg-primary-600 text-white rounded-br-sm shadow-sm'
                    : 'bg-white text-gray-900 rounded-bl-sm border border-gray-100 shadow-sm'
                }`}
              >
                <p className="text-[15px] leading-relaxed whitespace-pre-wrap">{msg.message}</p>
              </div>

              {msg.properties && msg.properties.length > 0 && (
                <div className="mt-4 grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {msg.properties.map((property) => (
                    <div
                      key={property.id}
                      onClick={() => navigate(`/property/${property.id}`)}
                      className="bg-white border border-gray-200 rounded-xl overflow-hidden hover:shadow-lg hover:border-primary-300 transition-all cursor-pointer group flex flex-col"
                    >
                      <div className="relative h-32 w-full">
                        <img
                          src={property.images?.[0] || 'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg'}
                          alt={property.title}
                          className="w-full h-full object-cover"
                        />
                        <div className="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
                          <span className="text-white font-medium bg-black/50 px-4 py-1.5 rounded-full backdrop-blur-sm">View Property</span>
                        </div>
                      </div>
                      <div className="p-3">
                        <h4 className="font-bold text-gray-900 line-clamp-1 group-hover:text-primary-600 transition-colors">
                          {property.title}
                        </h4>
                        <div className="flex items-center gap-1 text-sm text-gray-500 mt-1">
                          <MapPin className="w-3.5 h-3.5" />
                          <span className="line-clamp-1">{property.location}</span>
                        </div>
                        <div className="mt-3 flex items-center justify-between">
                          <span className="font-bold text-primary-600 text-lg">
                            {formatPrice(property.price)}
                          </span>
                          <div className="flex gap-2 text-gray-500 text-xs">
                            {property.bedrooms && <span>{property.bedrooms} Bed</span>}
                            {property.area_sqft && <span>{property.area_sqft} sqft</span>}
                          </div>
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>
        ))}

        {loading && (
          <div className="flex justify-start">
            <div className="bg-white border border-gray-100 shadow-sm p-4 rounded-2xl rounded-bl-sm">
              <div className="flex space-x-2 items-center h-6">
                <div className="w-2 h-2 bg-primary-400 rounded-full animate-bounce"></div>
                <div className="w-2 h-2 bg-primary-400 rounded-full animate-bounce" style={{ animationDelay: '0.1s' }}></div>
                <div className="w-2 h-2 bg-primary-400 rounded-full animate-bounce" style={{ animationDelay: '0.2s' }}></div>
              </div>
            </div>
          </div>
        )}

        <div ref={messagesEndRef} className="h-4" />
      </main>

      <div className="bg-white border-t border-gray-200 shrink-0 p-4 pb-safe">
        <div className="max-w-4xl mx-auto relative flex items-end gap-2">
          <div className="flex-1 relative rounded-2xl bg-gray-50 border border-gray-200 focus-within:border-primary-500 focus-within:ring-1 focus-within:ring-primary-500 transition-all flex items-center overflow-hidden">
            <textarea
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === 'Enter' && !e.shiftKey) {
                  e.preventDefault()
                  if (!loading) handleSend()
                }
              }}
              placeholder="E.g., I'm looking for a 3 BHK in MVP Colony..."
              className="w-full bg-transparent border-0 focus:ring-0 resize-none py-4 pl-4 pr-12 text-[15px] placeholder:text-gray-400 min-h-[56px] max-h-32"
              rows={1}
              disabled={loading}
              style={{
                height: 'auto',
                minHeight: '56px'
              }}
            />
            {isSupported && (
              <button
                onClick={handleVoiceToggle}
                className={`absolute right-2 bottom-2 p-2 rounded-xl transition-colors ${
                  isListening
                    ? 'bg-red-100 text-red-600 animate-pulse'
                    : 'text-gray-400 hover:bg-gray-200 hover:text-gray-600'
                }`}
                aria-label="Voice input"
              >
                {isListening ? <MicOff className="w-5 h-5" /> : <Mic className="w-5 h-5" />}
              </button>
            )}
          </div>
          
          <button
            onClick={() => handleSend()}
            disabled={loading || !input.trim()}
            className="shrink-0 h-14 w-14 rounded-2xl bg-primary-600 text-white flex items-center justify-center hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed shadow-sm"
          >
            <Send className="w-6 h-6 ml-1" />
          </button>
        </div>
        {isListening && (
          <div className="max-w-4xl mx-auto mt-2 text-center text-sm text-primary-600 animate-pulse font-medium">
            Listening... Speak now
          </div>
        )}
      </div>
    </div>
  )
}
