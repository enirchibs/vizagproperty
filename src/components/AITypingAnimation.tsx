import { useState, useEffect } from 'react'

const QUERIES = [
  { text: 'Vizag plots for sale under ', highlight: '50 lakhs', suffix: '' },
  { text: '2 BHK flats in ', highlight: 'Madhurawada', suffix: ' for sale' },
  { text: 'VMRDA approved plots near ', highlight: 'NH16 Vizag', suffix: '' },
  { text: 'Villas in Vizag ', highlight: 'gated communities', suffix: '' },
  { text: 'PG & Hostels near ', highlight: 'IT SEZ Vizag', suffix: '' }
]

const TYPING_SPEED = 50
const MOBILE_TYPING_SPEED = 60
const PAUSE_DURATION = 3000

export function AITypingAnimation() {
  const [currentQueryIndex, setCurrentQueryIndex] = useState(0)
  const [displayText, setDisplayText] = useState('')
  const [isTyping, setIsTyping] = useState(true)
  const [charIndex, setCharIndex] = useState(0)
  const [isMobile, setIsMobile] = useState(false)

  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 768)
    }
    checkMobile()
    window.addEventListener('resize', checkMobile)
    return () => window.removeEventListener('resize', checkMobile)
  }, [])

  useEffect(() => {
    const currentQuery = QUERIES[currentQueryIndex]
    const fullText = currentQuery.text + currentQuery.highlight + currentQuery.suffix
    const typingSpeed = isMobile ? MOBILE_TYPING_SPEED : TYPING_SPEED

    if (isTyping) {
      if (charIndex < fullText.length) {
        const timeout = setTimeout(() => {
          setDisplayText(fullText.slice(0, charIndex + 1))
          setCharIndex(charIndex + 1)
        }, typingSpeed)
        return () => clearTimeout(timeout)
      } else {
        const timeout = setTimeout(() => {
          setIsTyping(false)
          setCharIndex(0)
          setDisplayText('')
          setCurrentQueryIndex((currentQueryIndex + 1) % QUERIES.length)
        }, PAUSE_DURATION)
        return () => clearTimeout(timeout)
      }
    } else {
      setIsTyping(true)
    }
  }, [charIndex, currentQueryIndex, isTyping, isMobile])

  const currentQuery = QUERIES[currentQueryIndex]
  const highlightStart = currentQuery.text.length
  const highlightEnd = highlightStart + currentQuery.highlight.length

  return (
    <div className="text-center mb-4 min-h-[24px]">
      <p className="text-sm md:text-base text-gray-700 font-medium">
        <span className="text-gray-600">Ask AI like: "</span>
        {displayText.split('').map((char, index) => {
          const isHighlighted = index >= highlightStart && index < highlightEnd
          return (
            <span
              key={index}
              className={isHighlighted ? 'text-primary-600 font-bold' : 'text-gray-700'}
            >
              {char}
            </span>
          )
        })}
        <span className="text-gray-600">"</span>
        <span className="inline-block w-0.5 h-4 bg-primary-600 ml-1 animate-pulse" />
      </p>
    </div>
  )
}
