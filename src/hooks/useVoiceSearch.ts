import { useState, useEffect, useCallback } from 'react'
import { parseVoiceToLocality } from '../lib/voiceLocalityParser'

interface SpeechRecognition extends EventTarget {
  continuous: boolean
  interimResults: boolean
  lang: string
  start: () => void
  stop: () => void
  abort: () => void
  onresult: (event: SpeechRecognitionEvent) => void
  onerror: (event: SpeechRecognitionErrorEvent) => void
  onend: () => void
}

interface SpeechRecognitionEvent extends Event {
  results: SpeechRecognitionResultList
  resultIndex: number
}

interface SpeechRecognitionResultList {
  length: number
  item(index: number): SpeechRecognitionResult
  [index: number]: SpeechRecognitionResult
}

interface SpeechRecognitionResult {
  isFinal: boolean
  length: number
  item(index: number): SpeechRecognitionAlternative
  [index: number]: SpeechRecognitionAlternative
}

interface SpeechRecognitionAlternative {
  transcript: string
  confidence: number
}

interface SpeechRecognitionErrorEvent extends Event {
  error: string
  message: string
}

declare global {
  interface Window {
    SpeechRecognition: new () => SpeechRecognition
    webkitSpeechRecognition: new () => SpeechRecognition
  }
}

export function useVoiceSearch() {
  const [isListening, setIsListening] = useState(false)
  const [transcript, setTranscript] = useState('')
  const [recognition, setRecognition] = useState<SpeechRecognition | null>(null)
  const [isSupported, setIsSupported] = useState(false)
  const [localityMatch, setLocalityMatch] = useState<{ locality_name: string; locality_slug: string; confidence: string } | null>(null)
  const [noMatchMessage, setNoMatchMessage] = useState<string | null>(null)

  useEffect(() => {
    const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition

    if (SpeechRecognition) {
      const recognitionInstance = new SpeechRecognition()
      recognitionInstance.continuous = false
      recognitionInstance.interimResults = true
      recognitionInstance.lang = 'en-US'

      recognitionInstance.onresult = async (event: SpeechRecognitionEvent) => {
        const transcript = Array.from(event.results)
          .map(result => result[0])
          .map(result => result.transcript)
          .join('')

        setTranscript(transcript)

        if (event.results[event.results.length - 1].isFinal) {
          const match = await parseVoiceToLocality(transcript)
          if (match) {
            setLocalityMatch(match)
            setNoMatchMessage(null)
          } else {
            setLocalityMatch(null)
            setNoMatchMessage('Select a Vizag locality')
          }
        }
      }

      recognitionInstance.onerror = () => {
        setIsListening(false)
      }

      recognitionInstance.onend = () => {
        setIsListening(false)
      }

      setRecognition(recognitionInstance)
      setIsSupported(true)
    } else {
      setIsSupported(false)
    }
  }, [])

  const startListening = useCallback(() => {
    if (recognition && !isListening) {
      setTranscript('')
      setLocalityMatch(null)
      setNoMatchMessage(null)
      recognition.start()
      setIsListening(true)
    }
  }, [recognition, isListening])

  const stopListening = useCallback(() => {
    if (recognition && isListening) {
      recognition.stop()
      setIsListening(false)
    }
  }, [recognition, isListening])

  const resetTranscript = useCallback(() => {
    setTranscript('')
    setLocalityMatch(null)
    setNoMatchMessage(null)
  }, [])

  return {
    isListening,
    transcript,
    localityMatch,
    noMatchMessage,
    startListening,
    stopListening,
    resetTranscript,
    isSupported
  }
}
