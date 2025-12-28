import { useState, useEffect } from 'react'
import { Calendar, CheckCircle, Circle, Clock, MapPin, User, Phone, FileText, Lightbulb } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'
import { Property } from '../types'

interface VisitPreparationProps {
  property: Property
}

interface VisitChecklist {
  id: string
  item: string
  completed: boolean
  category: 'before' | 'during' | 'questions'
}

export function VisitPreparation({ property }: VisitPreparationProps) {
  const { user } = useAuth()
  const [showPrep, setShowPrep] = useState(false)
  const [visitDate, setVisitDate] = useState('')
  const [visitTime, setVisitTime] = useState('')
  const [visitScheduled, setVisitScheduled] = useState(false)
  const [checklist, setChecklist] = useState<VisitChecklist[]>([
    { id: '1', item: 'Review property photos and details', completed: false, category: 'before' },
    { id: '2', item: 'Check area analytics and price comparison', completed: false, category: 'before' },
    { id: '3', item: 'Prepare your negotiation strategy', completed: false, category: 'before' },
    { id: '4', item: 'Note down your maximum budget', completed: false, category: 'before' },
    { id: '5', item: 'Check natural lighting in all rooms', completed: false, category: 'during' },
    { id: '6', item: 'Test water pressure and fittings', completed: false, category: 'during' },
    { id: '7', item: 'Inspect walls for cracks or dampness', completed: false, category: 'during' },
    { id: '8', item: 'Check mobile network strength', completed: false, category: 'during' },
    { id: '9', item: 'Verify parking and entry/exit access', completed: false, category: 'during' },
    { id: '10', item: 'What are the maintenance charges?', completed: false, category: 'questions' },
    { id: '11', item: 'When is possession available?', completed: false, category: 'questions' },
    { id: '12', item: 'Are there any pending legal issues?', completed: false, category: 'questions' },
    { id: '13', item: 'What is included in the sale?', completed: false, category: 'questions' },
  ])

  useEffect(() => {
    if (user) {
      loadVisitStatus()
    }
  }, [property.id, user])

  const loadVisitStatus = async () => {
    if (!user) return

    try {
      const { data, error } = await supabase
        .from('property_visits')
        .select('*')
        .eq('user_id', user.id)
        .eq('property_id', property.id)
        .maybeSingle()

      if (error) throw error
      if (data) {
        setVisitScheduled(true)
        setVisitDate(data.visit_date?.split('T')[0] || '')
        setVisitTime(data.visit_time || '')
      }
    } catch (error) {
      console.error('Error loading visit status:', error)
    }
  }

  const scheduleVisit = async () => {
    if (!user || !visitDate || !visitTime) return

    try {
      const visitData = {
        user_id: user.id,
        property_id: property.id,
        visit_date: visitDate,
        visit_time: visitTime,
        status: 'scheduled'
      }

      const { error } = await supabase
        .from('property_visits')
        .upsert(visitData, { onConflict: 'user_id,property_id' })

      if (error) throw error

      setVisitScheduled(true)
      alert('Visit scheduled successfully! You will receive a confirmation.')
    } catch (error) {
      console.error('Error scheduling visit:', error)
      alert('Failed to schedule visit. Please try again.')
    }
  }

  const toggleChecklistItem = (id: string) => {
    setChecklist(prev =>
      prev.map(item =>
        item.id === id ? { ...item, completed: !item.completed } : item
      )
    )
  }

  const getChecklistByCategory = (category: 'before' | 'during' | 'questions') => {
    return checklist.filter(item => item.category === category)
  }

  const getCompletionRate = () => {
    const completed = checklist.filter(item => item.completed).length
    return Math.round((completed / checklist.length) * 100)
  }

  if (!user) {
    return (
      <div className="bg-gradient-to-br from-blue-50 to-cyan-50 rounded-2xl p-6 shadow-sm border border-blue-100 mb-6">
        <div className="flex items-center gap-3 mb-3">
          <div className="bg-blue-600 p-3 rounded-full">
            <Calendar className="h-6 w-6 text-white" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-gray-900">Site Visit Preparation</h3>
            <p className="text-gray-600 text-sm">Get a personalized checklist and schedule your visit</p>
          </div>
        </div>
        <p className="text-gray-600 text-sm bg-white rounded-lg p-4">
          Sign in to access visit preparation tools and schedule your site visit with the agent.
        </p>
      </div>
    )
  }

  return (
    <div className="bg-gradient-to-br from-blue-50 to-cyan-50 rounded-2xl p-6 shadow-sm border border-blue-100 mb-6">
      <button
        onClick={() => setShowPrep(!showPrep)}
        className="w-full text-left"
      >
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="bg-blue-600 p-3 rounded-full">
              <Calendar className="h-6 w-6 text-white" />
            </div>
            <div>
              <h3 className="text-xl font-bold text-gray-900">Site Visit Preparation</h3>
              <p className="text-gray-600 text-sm">Checklist, tips & scheduling</p>
            </div>
          </div>
          <button className="text-blue-600 font-medium hover:text-blue-700 transition-colors">
            {showPrep ? 'Hide' : 'Prepare'} Visit
          </button>
        </div>
      </button>

      {showPrep && (
        <div className="mt-6 space-y-6 animate-fade-in">
          <div className="bg-white rounded-xl p-4">
            <div className="flex items-center justify-between mb-4">
              <h4 className="font-bold text-gray-900">Visit Completion</h4>
              <span className="text-2xl font-bold text-blue-600">{getCompletionRate()}%</span>
            </div>
            <div className="w-full bg-gray-200 rounded-full h-2">
              <div
                className="bg-blue-600 h-2 rounded-full transition-all duration-300"
                style={{ width: `${getCompletionRate()}%` }}
              />
            </div>
          </div>

          {!visitScheduled ? (
            <div className="bg-white rounded-xl p-4">
              <div className="flex items-center gap-2 mb-4">
                <Calendar className="h-5 w-5 text-blue-600" />
                <h4 className="font-bold text-gray-900">Schedule Your Visit</h4>
              </div>
              <div className="space-y-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Preferred Date</label>
                  <input
                    type="date"
                    value={visitDate}
                    onChange={(e) => setVisitDate(e.target.value)}
                    min={new Date().toISOString().split('T')[0]}
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Preferred Time</label>
                  <select
                    value={visitTime}
                    onChange={(e) => setVisitTime(e.target.value)}
                    className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                  >
                    <option value="">Select time</option>
                    <option value="10:00">10:00 AM</option>
                    <option value="11:00">11:00 AM</option>
                    <option value="12:00">12:00 PM</option>
                    <option value="14:00">2:00 PM</option>
                    <option value="15:00">3:00 PM</option>
                    <option value="16:00">4:00 PM</option>
                    <option value="17:00">5:00 PM</option>
                  </select>
                </div>
                <button
                  onClick={scheduleVisit}
                  disabled={!visitDate || !visitTime}
                  className="w-full bg-blue-600 text-white py-3 rounded-lg hover:bg-blue-700 transition-colors font-medium disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  Schedule Visit
                </button>
              </div>
            </div>
          ) : (
            <div className="bg-green-50 border border-green-200 rounded-xl p-4">
              <div className="flex items-center gap-2 mb-3">
                <CheckCircle className="h-5 w-5 text-green-600" />
                <h4 className="font-bold text-green-900">Visit Scheduled</h4>
              </div>
              <div className="space-y-2 text-sm">
                <div className="flex items-center gap-2 text-gray-700">
                  <Calendar className="h-4 w-4" />
                  <span>{new Date(visitDate).toLocaleDateString('en-IN', { dateStyle: 'long' })}</span>
                </div>
                <div className="flex items-center gap-2 text-gray-700">
                  <Clock className="h-4 w-4" />
                  <span>{visitTime}</span>
                </div>
                <div className="flex items-center gap-2 text-gray-700">
                  <MapPin className="h-4 w-4" />
                  <span>{property.location}, {property.city}</span>
                </div>
                <div className="flex items-center gap-2 text-gray-700">
                  <User className="h-4 w-4" />
                  <span>{property.agent_name}</span>
                </div>
                <div className="flex items-center gap-2 text-gray-700">
                  <Phone className="h-4 w-4" />
                  <span>{property.agent_phone}</span>
                </div>
              </div>
            </div>
          )}

          <div className="bg-white rounded-xl p-4">
            <div className="flex items-center gap-2 mb-4">
              <FileText className="h-5 w-5 text-blue-600" />
              <h4 className="font-bold text-gray-900">Before Visit Checklist</h4>
            </div>
            <div className="space-y-2">
              {getChecklistByCategory('before').map(item => (
                <button
                  key={item.id}
                  onClick={() => toggleChecklistItem(item.id)}
                  className="w-full flex items-center gap-3 p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors text-left"
                >
                  {item.completed ? (
                    <CheckCircle className="h-5 w-5 text-green-600 flex-shrink-0" />
                  ) : (
                    <Circle className="h-5 w-5 text-gray-400 flex-shrink-0" />
                  )}
                  <span className={`text-sm ${item.completed ? 'text-gray-500 line-through' : 'text-gray-900'}`}>
                    {item.item}
                  </span>
                </button>
              ))}
            </div>
          </div>

          <div className="bg-white rounded-xl p-4">
            <div className="flex items-center gap-2 mb-4">
              <CheckCircle className="h-5 w-5 text-blue-600" />
              <h4 className="font-bold text-gray-900">During Visit Checklist</h4>
            </div>
            <div className="space-y-2">
              {getChecklistByCategory('during').map(item => (
                <button
                  key={item.id}
                  onClick={() => toggleChecklistItem(item.id)}
                  className="w-full flex items-center gap-3 p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors text-left"
                >
                  {item.completed ? (
                    <CheckCircle className="h-5 w-5 text-green-600 flex-shrink-0" />
                  ) : (
                    <Circle className="h-5 w-5 text-gray-400 flex-shrink-0" />
                  )}
                  <span className={`text-sm ${item.completed ? 'text-gray-500 line-through' : 'text-gray-900'}`}>
                    {item.item}
                  </span>
                </button>
              ))}
            </div>
          </div>

          <div className="bg-white rounded-xl p-4">
            <div className="flex items-center gap-2 mb-4">
              <Lightbulb className="h-5 w-5 text-blue-600" />
              <h4 className="font-bold text-gray-900">Questions to Ask</h4>
            </div>
            <div className="space-y-2">
              {getChecklistByCategory('questions').map(item => (
                <button
                  key={item.id}
                  onClick={() => toggleChecklistItem(item.id)}
                  className="w-full flex items-center gap-3 p-3 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors text-left"
                >
                  {item.completed ? (
                    <CheckCircle className="h-5 w-5 text-green-600 flex-shrink-0" />
                  ) : (
                    <Circle className="h-5 w-5 text-gray-400 flex-shrink-0" />
                  )}
                  <span className={`text-sm ${item.completed ? 'text-gray-500 line-through' : 'text-gray-900'}`}>
                    {item.item}
                  </span>
                </button>
              ))}
            </div>
          </div>

          <div className="bg-yellow-50 border border-yellow-200 rounded-xl p-4">
            <div className="flex items-start gap-2">
              <Lightbulb className="h-5 w-5 text-yellow-600 mt-0.5 flex-shrink-0" />
              <div>
                <p className="font-semibold text-yellow-900 mb-1">Pro Tip</p>
                <p className="text-sm text-yellow-800">
                  Visit the property during different times of the day if possible. Check morning sunlight, evening noise levels, and weekend traffic.
                </p>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
