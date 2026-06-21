import { lazy, Suspense } from 'react'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { AuthProvider, useAuth } from './contexts/AuthContext'
import { SearchProvider } from './contexts/SearchContext'
import { ErrorBoundary } from './components/ErrorBoundary'
import { Header } from './components/Header'
import { Footer } from './components/Footer'
import { ChatBot } from './components/ChatBot'
import { FloatingWhatsAppButton } from './components/FloatingWhatsAppButton'
import { TopAnnouncementBar } from './components/TopAnnouncementBar'
import { UsernameModal } from './components/UsernameModal'
import { CookieBanner } from './components/CookieBanner'
import { HomePage } from './pages/HomePage'

const LoginPage = lazy(() => import('./pages/LoginPage').then(m => ({ default: m.LoginPage })))
const PropertiesPage = lazy(() => import('./pages/PropertiesPage').then(m => ({ default: m.PropertiesPage })))
const PropertyDetailsPage = lazy(() => import('./pages/PropertyDetailsPage').then(m => ({ default: m.PropertyDetailsPage })))
const DashboardPage = lazy(() => import('./pages/DashboardPage').then(m => ({ default: m.DashboardPage })))
const AddPropertyPage = lazy(() => import('./pages/AddPropertyPage').then(m => ({ default: m.AddPropertyPage })))
const RecommendationsPage = lazy(() => import('./pages/RecommendationsPage').then(m => ({ default: m.RecommendationsPage })))
const VizagPage = lazy(() => import('./pages/VizagPage').then(m => ({ default: m.VizagPage })))
const MadhurawadaPage = lazy(() => import('./pages/MadhurawadaPage').then(m => ({ default: m.MadhurawadaPage })))
const YendadaPage = lazy(() => import('./pages/YendadaPage').then(m => ({ default: m.YendadaPage })))
const PMPalemPage = lazy(() => import('./pages/PMPalemPage').then(m => ({ default: m.PMPalemPage })))
const MVPColonyPage = lazy(() => import('./pages/MVPColonyPage').then(m => ({ default: m.MVPColonyPage })))
const GajuwakaPage = lazy(() => import('./pages/GajuwakaPage').then(m => ({ default: m.GajuwakaPage })))
const VMRDAplotsPage = lazy(() => import('./pages/VMRDAplotsPage'))
const VMRDAApprovedPlotsPage = lazy(() => import('./pages/VMRDAApprovedPlotsPage'))
const ResidentialPropertyPage = lazy(() => import('./pages/ResidentialPropertyPage'))
const FlatsForSalePage = lazy(() => import('./pages/FlatsForSalePage'))
const VillasPage = lazy(() => import('./pages/VillasPage'))
const FlatsForRentPage = lazy(() => import('./pages/FlatsForRentPage'))
const PGHostelsPage = lazy(() => import('./pages/PGHostelsPage'))
const GatedCommunityPlotsPage = lazy(() => import('./pages/GatedCommunityPlotsPage'))
const MyListingsPage = lazy(() => import('./pages/MyListingsPage').then(m => ({ default: m.MyListingsPage })))
const AdminPropertiesPage = lazy(() => import('./pages/AdminPropertiesPage').then(m => ({ default: m.AdminPropertiesPage })))
const AdminDashboardPage = lazy(() => import('./pages/AdminDashboardPage').then(m => ({ default: m.AdminDashboardPage })))
const EditPropertyPage = lazy(() => import('./pages/EditPropertyPage').then(m => ({ default: m.EditPropertyPage })))
const SearchPage = lazy(() => import('./pages/SearchPage').then(m => ({ default: m.SearchPage })))
const MobileSearchPage = lazy(() => import('./pages/MobileSearchPage').then(m => ({ default: m.MobileSearchPage })))
const BlogPage = lazy(() => import('./pages/BlogPage').then(m => ({ default: m.BlogPage })))
const BlogPostPage = lazy(() => import('./pages/BlogPostPage').then(m => ({ default: m.BlogPostPage })))
const AboutUsPage = lazy(() => import('./pages/AboutUsPage').then(m => ({ default: m.AboutUsPage })))
const ContactUsPage = lazy(() => import('./pages/ContactUsPage').then(m => ({ default: m.ContactUsPage })))
const PrivacyPolicyPage = lazy(() => import('./pages/PrivacyPolicyPage').then(m => ({ default: m.PrivacyPolicyPage })))
const TermsAndConditionsPage = lazy(() => import('./pages/TermsAndConditionsPage').then(m => ({ default: m.TermsAndConditionsPage })))
const DisclaimerPage = lazy(() => import('./pages/DisclaimerPage').then(m => ({ default: m.DisclaimerPage })))
const BhogapuramPlotsPage = lazy(() => import('./pages/BhogapuramPlotsPage').then(m => ({ default: m.BhogapuramPlotsPage })))
const MadhurawadaResidentialPage = lazy(() => import('./pages/MadhurawadaResidentialPage').then(m => ({ default: m.MadhurawadaResidentialPage })))
const OfficeSpacePage = lazy(() => import('./pages/OfficeSpacePage').then(m => ({ default: m.OfficeSpacePage })))
const BhogapuramImpactPage = lazy(() => import('./pages/BhogapuramImpactPage').then(m => ({ default: m.BhogapuramImpactPage })))

function AppContent() {
  const { showUsernamePrompt, setShowUsernamePrompt } = useAuth()

  return (
    <Router>
      <div className="min-h-screen bg-gray-50">
        <TopAnnouncementBar />
        <Header />
        <Suspense fallback={<div className="flex items-center justify-center min-h-screen"><div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div></div>}>
          <ErrorBoundary>
            <Routes>
              <Route path="/" element={<HomePage />} />
              <Route path="/login" element={<LoginPage />} />
              <Route path="/search" element={<SearchPage />} />
              <Route path="/mobile-search" element={<MobileSearchPage />} />
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
              <Route path="/admin" element={<AdminPropertiesPage />} />
              <Route path="/admin/dashboard" element={<AdminDashboardPage />} />
              <Route path="/admin/properties" element={<AdminPropertiesPage />} />
              <Route path="/add-property" element={<AddPropertyPage />} />
              <Route path="/post-property" element={<AddPropertyPage />} />
              <Route path="/edit-property/:id" element={<EditPropertyPage />} />
              <Route path="/blog" element={<BlogPage />} />
              <Route path="/blog/:slug" element={<BlogPostPage />} />
              <Route path="/about" element={<AboutUsPage />} />
              <Route path="/contact" element={<ContactUsPage />} />
              <Route path="/privacy-policy" element={<PrivacyPolicyPage />} />
              <Route path="/terms-and-conditions" element={<TermsAndConditionsPage />} />
              <Route path="/disclaimer" element={<DisclaimerPage />} />
              
              {/* New SEO Silo Routes */}
              <Route path="/plots/bhogapuram" element={<BhogapuramPlotsPage />} />
              <Route path="/residential/madhurawada" element={<MadhurawadaResidentialPage />} />
              <Route path="/commercial/office-space" element={<OfficeSpacePage />} />
              <Route path="/insights/bhogapuram-airport-impact" element={<BhogapuramImpactPage />} />
            </Routes>
          </ErrorBoundary>
        </Suspense>
        <Footer />
        <ChatBot />
        <FloatingWhatsAppButton />
        <CookieBanner />

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
      <SearchProvider>
        <AppContent />
      </SearchProvider>
    </AuthProvider>
  )
}

export default App
