import { lazy, Suspense, useEffect } from 'react'
import { BrowserRouter as Router, Routes, Route, useLocation } from 'react-router-dom'
import { AuthProvider, useAuth } from './contexts/AuthContext'
import { SearchProvider } from './contexts/SearchContext'
import { ErrorBoundary } from './components/ErrorBoundary'
import { Header } from './components/Header'
import { Footer } from './components/Footer'
import { ChatBot } from './components/ChatBot'
import { FloatingWhatsAppButton } from './components/FloatingWhatsAppButton'
import { TopAnnouncementBar } from './components/TopAnnouncementBar'
import { UsernameModal } from './components/UsernameModal'
import { HomePage } from './pages/HomePage'

// Wrapper to handle ChunkLoadErrors after deployments
const lazyWithRetry = (componentImport: () => Promise<any>) =>
  lazy(async () => {
    try {
      return await componentImport()
    } catch (error: any) {
      // If it's a chunk load error, refresh the page to get the new hashes
      if (error && (error.name === 'ChunkLoadError' || String(error.message).includes('fetch') || String(error.message).includes('dynamically imported module'))) {
        window.location.reload()
      }
      throw error
    }
  })

const LoginPage = lazyWithRetry(() => import('./pages/LoginPage').then(m => ({ default: m.LoginPage })))
const PropertiesPage = lazyWithRetry(() => import('./pages/PropertiesPage').then(m => ({ default: m.PropertiesPage })))
const PropertyDetailsPage = lazyWithRetry(() => import('./pages/PropertyDetailsPage').then(m => ({ default: m.PropertyDetailsPage })))
const DashboardPage = lazyWithRetry(() => import('./pages/DashboardPage').then(m => ({ default: m.DashboardPage })))
const AddPropertyPage = lazyWithRetry(() => import('./pages/AddPropertyPage').then(m => ({ default: m.AddPropertyPage })))
const RecommendationsPage = lazyWithRetry(() => import('./pages/RecommendationsPage').then(m => ({ default: m.RecommendationsPage })))
const VizagPage = lazyWithRetry(() => import('./pages/VizagPage').then(m => ({ default: m.VizagPage })))
const MadhurawadaPage = lazyWithRetry(() => import('./pages/MadhurawadaPage').then(m => ({ default: m.MadhurawadaPage })))
const YendadaPage = lazyWithRetry(() => import('./pages/YendadaPage').then(m => ({ default: m.YendadaPage })))
const PMPalemPage = lazyWithRetry(() => import('./pages/PMPalemPage').then(m => ({ default: m.PMPalemPage })))
const MVPColonyPage = lazyWithRetry(() => import('./pages/MVPColonyPage').then(m => ({ default: m.MVPColonyPage })))
const GajuwakaPage = lazyWithRetry(() => import('./pages/GajuwakaPage').then(m => ({ default: m.GajuwakaPage })))
const VMRDAplotsPage = lazyWithRetry(() => import('./pages/VMRDAplotsPage'))
const VMRDAApprovedPlotsPage = lazyWithRetry(() => import('./pages/VMRDAApprovedPlotsPage'))
const ResidentialPropertyPage = lazyWithRetry(() => import('./pages/ResidentialPropertyPage'))
const FlatsForSalePage = lazyWithRetry(() => import('./pages/FlatsForSalePage'))
const VillasPage = lazyWithRetry(() => import('./pages/VillasPage'))
const FlatsForRentPage = lazyWithRetry(() => import('./pages/FlatsForRentPage'))
const PGHostelsPage = lazyWithRetry(() => import('./pages/PGHostelsPage'))
const GatedCommunityPlotsPage = lazyWithRetry(() => import('./pages/GatedCommunityPlotsPage'))
const MyListingsPage = lazyWithRetry(() => import('./pages/MyListingsPage').then(m => ({ default: m.MyListingsPage })))
const AdminPropertiesPage = lazyWithRetry(() => import('./pages/AdminPropertiesPage').then(m => ({ default: m.AdminPropertiesPage })))
const AdminDashboardPage = lazyWithRetry(() => import('./pages/AdminDashboardPage').then(m => ({ default: m.AdminDashboardPage })))
const EditPropertyPage = lazyWithRetry(() => import('./pages/EditPropertyPage').then(m => ({ default: m.EditPropertyPage })))
const SearchPage = lazyWithRetry(() => import('./pages/SearchPage').then(m => ({ default: m.SearchPage })))
const MobileSearchPage = lazyWithRetry(() => import('./pages/MobileSearchPage').then(m => ({ default: m.MobileSearchPage })))
const BlogPage = lazyWithRetry(() => import('./pages/BlogPage').then(m => ({ default: m.BlogPage })))
const BlogPostPage = lazyWithRetry(() => import('./pages/BlogPostPage').then(m => ({ default: m.BlogPostPage })))
const AboutUsPage = lazyWithRetry(() => import('./pages/AboutUsPage').then(m => ({ default: m.AboutUsPage })))
const ContactUsPage = lazyWithRetry(() => import('./pages/ContactUsPage').then(m => ({ default: m.ContactUsPage })))
const PrivacyPolicyPage = lazyWithRetry(() => import('./pages/PrivacyPolicyPage').then(m => ({ default: m.PrivacyPolicyPage })))
const TermsAndConditionsPage = lazyWithRetry(() => import('./pages/TermsAndConditionsPage').then(m => ({ default: m.TermsAndConditionsPage })))
const DisclaimerPage = lazyWithRetry(() => import('./pages/DisclaimerPage').then(m => ({ default: m.DisclaimerPage })))
const BhogapuramPlotsPage = lazyWithRetry(() => import('./pages/BhogapuramPlotsPage').then(m => ({ default: m.BhogapuramPlotsPage })))
const MadhurawadaResidentialPage = lazyWithRetry(() => import('./pages/MadhurawadaResidentialPage').then(m => ({ default: m.MadhurawadaResidentialPage })))
const OfficeSpacePage = lazyWithRetry(() => import('./pages/OfficeSpacePage').then(m => ({ default: m.OfficeSpacePage })))
const BhogapuramImpactPage = lazyWithRetry(() => import('./pages/BhogapuramImpactPage').then(m => ({ default: m.BhogapuramImpactPage })))

function ScrollToTop() {
  const { pathname } = useLocation()

  useEffect(() => {
    window.scrollTo(0, 0)
  }, [pathname])

  return null
}

function AppContent() {
  const { showUsernamePrompt, setShowUsernamePrompt } = useAuth()

  return (
    <Router>
      <ScrollToTop />
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
