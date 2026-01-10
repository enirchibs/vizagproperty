import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { AuthProvider, useAuth } from './contexts/AuthContext'
import { Header } from './components/Header'
import { Footer } from './components/Footer'
import { ChatBot } from './components/ChatBot'
import { FloatingWhatsAppButton } from './components/FloatingWhatsAppButton'
import { UsernameModal } from './components/UsernameModal'
import { HomePage } from './pages/HomePage'
import { PropertiesPage } from './pages/PropertiesPage'
import { PropertyDetailsPage } from './pages/PropertyDetailsPage'
import { DashboardPage } from './pages/DashboardPage'
import { AddPropertyPage } from './pages/AddPropertyPage'
import { RecommendationsPage } from './pages/RecommendationsPage'
import { VizagPage } from './pages/VizagPage'
import { MadhurawadaPage } from './pages/MadhurawadaPage'
import { YendadaPage } from './pages/YendadaPage'
import { PMPalemPage } from './pages/PMPalemPage'
import { MVPColonyPage } from './pages/MVPColonyPage'
import { GajuwakaPage } from './pages/GajuwakaPage'
import VMRDAplotsPage from './pages/VMRDAplotsPage'
import VMRDAApprovedPlotsPage from './pages/VMRDAApprovedPlotsPage'
import ResidentialPropertyPage from './pages/ResidentialPropertyPage'
import FlatsForSalePage from './pages/FlatsForSalePage'
import VillasPage from './pages/VillasPage'
import FlatsForRentPage from './pages/FlatsForRentPage'
import PGHostelsPage from './pages/PGHostelsPage'
import GatedCommunityPlotsPage from './pages/GatedCommunityPlotsPage'
import { MyListingsPage } from './pages/MyListingsPage'

function AppContent() {
  const { showUsernamePrompt, setShowUsernamePrompt } = useAuth()

  return (
    <Router>
      <div className="min-h-screen bg-gray-50">
        <Header />
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/vizag" element={<VizagPage />} />
          <Route path="/vmrda-plots" element={<VMRDAplotsPage />} />
          <Route path="/vmrda-approved-plots-vizag" element={<VMRDAApprovedPlotsPage />} />
          <Route path="/residential-property-in-vizag" element={<ResidentialPropertyPage />} />
          <Route path="/flats-for-sale-in-vizag" element={<FlatsForSalePage />} />
          <Route path="/villas-in-vizag" element={<VillasPage />} />
          <Route path="/flats-for-rent-vizag" element={<FlatsForRentPage />} />
          <Route path="/pg-hostels-in-vizag" element={<PGHostelsPage />} />
          <Route path="/gated-community-plots-vizag" element={<GatedCommunityPlotsPage />} />
          <Route path="/madhurawada" element={<MadhurawadaPage />} />
          <Route path="/yendada" element={<YendadaPage />} />
          <Route path="/pm-palem" element={<PMPalemPage />} />
          <Route path="/mvp-colony" element={<MVPColonyPage />} />
          <Route path="/gajuwaka" element={<GajuwakaPage />} />
          <Route path="/vizag/madhurawada" element={<MadhurawadaPage />} />
          <Route path="/vizag/yendada" element={<YendadaPage />} />
          <Route path="/vizag/pm-palem" element={<PMPalemPage />} />
          <Route path="/vizag/mvp-colony" element={<MVPColonyPage />} />
          <Route path="/vizag/gajuwaka" element={<GajuwakaPage />} />
          <Route path="/properties" element={<PropertiesPage />} />
          <Route path="/property/:id" element={<PropertyDetailsPage />} />
          <Route path="/recommendations" element={<RecommendationsPage />} />
          <Route path="/dashboard" element={<DashboardPage />} />
          <Route path="/favorites" element={<DashboardPage />} />
          <Route path="/my-listings" element={<MyListingsPage />} />
          <Route path="/add-property" element={<AddPropertyPage />} />
        </Routes>
        <Footer />
        <ChatBot />
        <FloatingWhatsAppButton />

        {showUsernamePrompt && (
          <UsernameModal onClose={() => setShowUsernamePrompt(false)} />
        )}
      </div>
    </Router>
  )
}

function App() {
  return (
    <AuthProvider>
      <AppContent />
    </AuthProvider>
  )
}

export default App
