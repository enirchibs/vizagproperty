import { useState } from 'react'
import { Link } from 'react-router-dom'
import { SEOHead } from '../components/SEOHead'
import { ShieldCheck, Search, FileText, CheckCircle, AlertTriangle, ExternalLink, HelpCircle, MapPin } from 'lucide-react'

export function LegalVerificationPage() {
  const [reraInput, setReraInput] = useState('')
  const [vmrdaInput, setVmrdaInput] = useState('')
  
  const schema = {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "VMRDA & RERA Property Verification Guide Vizag | VizagProperty",
    "description": "Learn how to verify VMRDA, DTCP, and APRERA approvals for properties in Visakhapatnam. Step-by-step guide to safe real estate investment.",
    "url": "https://vizagproperty.co.in/legal-verification"
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title="VMRDA & RERA Verification Guide Visakhapatnam | VizagProperty"
        description="Your complete guide to verifying VMRDA, DTCP, and APRERA approvals for safe real estate investments in Vizag. Includes direct links and step-by-step instructions."
        schema={schema}
      />
      
      {/* Header */}
      <div className="bg-primary-900 text-white py-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <ShieldCheck className="h-16 w-16 mx-auto mb-6 text-green-400" />
          <h1 className="text-4xl md:text-5xl font-extrabold mb-4">Legal & Approval Verification Center</h1>
          <p className="text-xl text-primary-100 max-w-3xl mx-auto">
            Don't risk your life savings. Learn exactly how to verify VMRDA layouts and RERA registrations before buying property in Visakhapatnam.
          </p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          
          {/* AP RERA Section */}
          <div className="bg-white rounded-2xl shadow-lg border border-gray-100 overflow-hidden flex flex-col">
            <div className="p-8 flex-1">
              <div className="flex items-center mb-6">
                <div className="w-12 h-12 bg-blue-100 text-blue-700 rounded-xl flex items-center justify-center mr-4">
                  <FileText className="h-6 w-6" />
                </div>
                <h2 className="text-2xl font-bold text-gray-900">AP RERA Verification</h2>
              </div>
              <p className="text-gray-600 mb-6">
                The Andhra Pradesh Real Estate Regulatory Authority (APRERA) protects buyers. All ongoing projects exceeding 500 sq.m or 8 apartments must be registered.
              </p>
              
              <div className="bg-blue-50 rounded-xl p-6 mb-8 border border-blue-100">
                <h3 className="font-semibold text-blue-900 mb-2 flex items-center">
                  <Search className="h-4 w-4 mr-2" />
                  Quick Check Link
                </h3>
                <p className="text-sm text-blue-800 mb-4">
                  Enter the project's RERA Registration Number (e.g., P03290...) to find it on the official portal.
                </p>
                <div className="flex gap-2">
                  <input 
                    type="text" 
                    value={reraInput}
                    onChange={(e) => setReraInput(e.target.value)}
                    placeholder="Enter RERA No." 
                    className="flex-1 px-4 py-2 border border-blue-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none"
                  />
                  <a 
                    href={`https://rera.ap.gov.in/RERA/Views/RegisteredProjects.aspx`} 
                    target="_blank" 
                    rel="noopener noreferrer"
                    className="bg-blue-600 text-white px-4 py-2 rounded-lg font-medium hover:bg-blue-700 transition-colors flex items-center"
                  >
                    Verify <ExternalLink className="ml-2 h-4 w-4" />
                  </a>
                </div>
              </div>

              <div className="space-y-4">
                <h3 className="font-bold text-gray-900">What to check on the RERA portal:</h3>
                <ul className="space-y-2 text-sm text-gray-600">
                  <li className="flex items-start"><CheckCircle className="h-4 w-4 text-green-500 mr-2 mt-0.5" /> Project Status (Ongoing vs Stalled)</li>
                  <li className="flex items-start"><CheckCircle className="h-4 w-4 text-green-500 mr-2 mt-0.5" /> Approved building plans vs Actual marketing plans</li>
                  <li className="flex items-start"><CheckCircle className="h-4 w-4 text-green-500 mr-2 mt-0.5" /> Legal title documents of the land</li>
                  <li className="flex items-start"><CheckCircle className="h-4 w-4 text-green-500 mr-2 mt-0.5" /> Promised completion date</li>
                </ul>
              </div>
            </div>
          </div>

          {/* VMRDA Section */}
          <div className="bg-white rounded-2xl shadow-lg border border-gray-100 overflow-hidden flex flex-col">
            <div className="p-8 flex-1">
              <div className="flex items-center mb-6">
                <div className="w-12 h-12 bg-green-100 text-green-700 rounded-xl flex items-center justify-center mr-4">
                  <MapPin className="h-6 w-6" />
                </div>
                <h2 className="text-2xl font-bold text-gray-900">VMRDA / DTCP Layouts</h2>
              </div>
              <p className="text-gray-600 mb-6">
                Visakhapatnam Metropolitan Region Development Authority (VMRDA) approval is mandatory for any land layout or plotting venture in and around Vizag.
              </p>

              <div className="bg-green-50 rounded-xl p-6 mb-8 border border-green-100">
                <h3 className="font-semibold text-green-900 mb-2 flex items-center">
                  <Search className="h-4 w-4 mr-2" />
                  Approved Layouts List
                </h3>
                <p className="text-sm text-green-800 mb-4">
                  Always ask the developer for the VMRDA L.P. No. (Layout Plan Number).
                </p>
                <div className="flex gap-2">
                  <input 
                    type="text" 
                    value={vmrdaInput}
                    onChange={(e) => setVmrdaInput(e.target.value)}
                    placeholder="Enter L.P. No (Optional)" 
                    className="flex-1 px-4 py-2 border border-green-200 rounded-lg focus:ring-2 focus:ring-green-500 focus:outline-none"
                  />
                  <a 
                    href="https://vmrda.gov.in/approved-layouts.aspx" 
                    target="_blank" 
                    rel="noopener noreferrer"
                    className="bg-green-600 text-white px-4 py-2 rounded-lg font-medium hover:bg-green-700 transition-colors flex items-center"
                  >
                    VMRDA Portal <ExternalLink className="ml-2 h-4 w-4" />
                  </a>
                </div>
              </div>

              <div className="space-y-4">
                <h3 className="font-bold text-gray-900">Panchayat Layout Warning:</h3>
                <div className="flex items-start bg-red-50 p-4 rounded-lg border border-red-100">
                  <AlertTriangle className="h-5 w-5 text-red-500 mr-3 flex-shrink-0 mt-0.5" />
                  <p className="text-sm text-red-800">
                    Gram Panchayat layouts without VMRDA/DTCP approval are illegal. You will not get bank loans, and the government may demolish structures or refuse registration. Always demand the final VMRDA L.P Number.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Essential Documents Checklist */}
        <div className="mt-12 bg-white rounded-2xl shadow-lg border border-gray-100 p-8">
          <div className="text-center mb-10">
            <h2 className="text-3xl font-bold text-gray-900">Before You Pay the Advance</h2>
            <p className="text-gray-600 mt-2">Always demand these 5 critical documents from the seller or builder.</p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {[
              { title: 'Link Documents (13-30 Years)', desc: 'Traces the history of ownership. Ensures the current seller actually owns it.' },
              { title: 'EC (Encumbrance Certificate)', desc: 'Proves the property is free from any legal dues, loans, or pending mortgages.' },
              { title: 'Approved Plan', desc: 'VMRDA/GVMC approved building plan. Ensures no illegal deviations.' },
              { title: 'Occupancy Certificate (OC)', desc: 'For completed apartments. Proves the building is legally fit for occupation.' },
              { title: 'Tax Receipts', desc: 'Up-to-date property tax and water tax receipts in the current owner\'s name.' }
            ].map((doc, i) => (
              <div key={i} className="border border-gray-200 rounded-xl p-5 hover:border-primary-500 transition-colors">
                <div className="w-8 h-8 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center font-bold mb-3">
                  {i + 1}
                </div>
                <h3 className="font-bold text-gray-900 mb-2">{doc.title}</h3>
                <p className="text-sm text-gray-600">{doc.desc}</p>
              </div>
            ))}
            <div className="border border-primary-200 bg-primary-50 rounded-xl p-5 flex flex-col justify-center items-center text-center">
              <HelpCircle className="h-8 w-8 text-primary-600 mb-3" />
              <h3 className="font-bold text-gray-900 mb-2">Need Expert Help?</h3>
              <p className="text-sm text-gray-600 mb-4">Our legal team can verify these documents for you.</p>
              <Link to="/contact" className="text-primary-600 font-semibold hover:underline">Contact Legal Desk</Link>
            </div>
          </div>
        </div>

      </div>
    </div>
  )
}
