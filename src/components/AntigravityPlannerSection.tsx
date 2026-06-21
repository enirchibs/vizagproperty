import { useRef, useState } from 'react';
import { Wand2, Maximize, Cuboid } from 'lucide-react';

interface AntigravityPlannerSectionProps {
  plotId?: string;
  title?: string;
}

export function AntigravityPlannerSection({ title = 'Antigravity 3D Planner' }: AntigravityPlannerSectionProps) {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [isGenerating, setIsGenerating] = useState(false);
  const [hasGenerated, setHasGenerated] = useState(false);

  const handleGenerateElevation = async () => {
    setIsGenerating(true);
    // Simulated API call to Stable Diffusion / 3D Backend
    setTimeout(() => {
      setIsGenerating(false);
      setHasGenerated(true);
    }, 4000);
  };

  return (
    <section className="relative w-full max-w-7xl mx-auto my-12 bg-slate-900 rounded-3xl overflow-hidden shadow-2xl border border-slate-700">
      {/* Header Overlay */}
      <div className="absolute top-0 left-0 w-full p-6 bg-gradient-to-b from-black/80 to-transparent z-10 flex flex-col md:flex-row md:justify-between items-start md:items-center gap-4">
        <div>
          <h2 className="text-2xl font-bold text-white flex items-center gap-2">
            <Cuboid className="text-cyan-400 animate-pulse" />
            {title}
          </h2>
          <p className="text-slate-300 text-sm mt-1">Visualize futuristic, cantilevered architectures on this exact plot.</p>
        </div>
        <button className="bg-cyan-500 hover:bg-cyan-400 text-slate-900 font-bold py-2 px-6 rounded-full flex items-center gap-2 transition-transform hover:scale-105 shadow-[0_0_15px_rgba(6,182,212,0.5)]">
          <Maximize className="w-4 h-4" /> Fullscreen
        </button>
      </div>

      {/* WebGL Canvas Container */}
      <div className="relative w-full h-[400px] md:h-[600px] bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-slate-800 via-slate-950 to-black">
        {hasGenerated ? (
          <div className="absolute inset-0 flex items-center justify-center text-cyan-400 font-bold text-xl tracking-widest bg-black">
            [ WebGL Canvas Active - Futuristic Model Rendered ]
          </div>
        ) : (
           <div className="absolute inset-0 flex flex-col items-center justify-center opacity-30 pointer-events-none">
             <Cuboid className="w-32 h-32 text-cyan-500 mb-4" strokeWidth={1} />
             <div className="text-cyan-300 tracking-[0.3em] font-light">WAITING FOR GENERATION</div>
           </div>
        )}
        
        <canvas 
          ref={canvasRef} 
          className="w-full h-full cursor-grab active:cursor-grabbing relative z-0"
          style={{ touchAction: 'none' }}
        />
        
        {/* Loading Overlay */}
        {isGenerating && (
          <div className="absolute inset-0 bg-slate-900/80 backdrop-blur-sm flex flex-col items-center justify-center z-20 transition-all duration-300">
            <div className="w-16 h-16 border-4 border-cyan-500 border-t-transparent rounded-full animate-spin"></div>
            <p className="text-cyan-400 font-bold mt-6 tracking-wide animate-pulse">Synthesizing Antigravity Architecture via AI...</p>
            <p className="text-slate-400 text-sm mt-2">Loading terrain data and generating procedural mesh...</p>
          </div>
        )}
      </div>

      {/* Action Bar / Controls */}
      <div className="absolute bottom-0 left-0 w-full p-6 bg-gradient-to-t from-black via-black/90 to-transparent z-10">
        <div className="flex flex-col md:flex-row gap-4 items-center justify-center md:justify-start">
          <button 
            onClick={handleGenerateElevation}
            disabled={isGenerating}
            className="group relative overflow-hidden bg-gradient-to-r from-cyan-600 to-blue-600 text-white font-extrabold py-3 px-8 rounded-xl shadow-[0_0_20px_rgba(8,145,178,0.5)] hover:shadow-[0_0_30px_rgba(8,145,178,0.8)] transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            <span className="relative z-10 flex items-center gap-2">
              <Wand2 className={`w-5 h-5 ${isGenerating ? 'animate-spin' : 'group-hover:rotate-12'} transition-transform`} />
              {isGenerating ? 'Generating...' : (hasGenerated ? 'Regenerate Elevation' : 'Generate Antigravity Elevation')}
            </span>
            <div className="absolute inset-0 bg-white/20 translate-y-full group-hover:translate-y-0 transition-transform duration-300 ease-in-out"></div>
          </button>
          
          <div className="flex gap-2 opacity-80">
            <span className="bg-slate-800 border border-slate-600 text-slate-300 text-xs px-3 py-1.5 rounded-md flex items-center gap-1">
              <span className="w-2 h-2 rounded-full bg-green-400 animate-pulse"></span>
              Stable Diffusion AI
            </span>
            <span className="bg-slate-800 border border-slate-600 text-slate-300 text-xs px-3 py-1.5 rounded-md">Three.js Engine</span>
          </div>
        </div>
      </div>
    </section>
  );
}
