'use client';

import { useState } from 'react';
import { Canvas } from '@react-three/fiber';
import { OrbitControls, Grid, Box } from '@react-three/drei';
import { supabase } from '../../lib/supabase';

interface PlannerProps {
  locality: string;
}

export default function AntigravityPlanner({ locality }: PlannerProps) {
  const [isGenerating, setIsGenerating] = useState(false);
  const [generatedImage, setGeneratedImage] = useState<string | null>(null);
  const [stylePreset, setStylePreset] = useState('modern-contemporary');
  
  // Height configurations for the antigravity structural simulation
  const [groundHeight, setGroundHeight] = useState(2);
  const [cantileverDepth, setCantileverDepth] = useState(4);

  const handleAiGeneration = async () => {
    setIsGenerating(true);
    
    // 1. In production, take a snapshot of the WebGL Canvas context to generate a depth map
    // 2. Pass the depth map blob along with the prompt payload to your Stable Diffusion API route
    try {
      const { data, error } = await supabase.functions.invoke('generate-elevation', {
        body: {
          style: stylePreset,
          locality: locality,
          cantilever: cantileverDepth,
        },
      });

      if (error) {
        throw error;
      }

      if (data && data.url) {
        setGeneratedImage(data.url);
      }
    } catch (error) {
      console.error("AI Engine rendering pipeline failure:", error);
    } finally {
      setIsGenerating(false);
    }
  };

  return (
    <div className="w-full bg-slate-950 rounded-2xl overflow-hidden border border-slate-800 grid grid-cols-1 lg:grid-cols-4 min-h-[600px]">
      
      {/* LEFT CONTROL PANEL: Configurations & Parameters */}
      <div className="p-6 bg-slate-900 border-r border-slate-800 flex flex-col justify-between lg:col-span-1">
        <div>
          <h3 className="text-white text-lg font-bold mb-4">Antigravity 3D Configurator</h3>
          
          {/* Architectural Presets Selector */}
          <div className="mb-4">
            <label className="text-xs text-slate-400 block mb-2 uppercase tracking-wider">Design Style</label>
            <select 
              value={stylePreset} 
              onChange={(e) => setStylePreset(e.target.value)}
              className="w-full bg-slate-800 text-white border border-slate-700 rounded px-3 py-2 text-sm focus:outline-none focus:border-blue-500"
            >
              <option value="modern-contemporary">Modern Contemporary</option>
              <option value="ultra-minimalist">Ultra-Minimalist Void</option>
              <option value="tropical-modern">Tropical / Coastal Modern</option>
              <option value="industrial-hybrid">Industrial Concrete & Glass</option>
            </select>
          </div>

          {/* Slider for Cantilever Depth Configuration */}
          <div className="mb-4">
            <label className="text-xs text-slate-400 block mb-2 uppercase tracking-wider">
              Cantilever Projection: {cantileverDepth}m
            </label>
            <input 
              type="range" min="2" max="6" step="0.5" 
              value={cantileverDepth} 
              onChange={(e) => setCantileverDepth(parseFloat(e.target.value))}
              className="w-full accent-blue-500"
            />
          </div>

          {/* Slider for Recessed Ground Floor Offset */}
          <div className="mb-6">
            <label className="text-xs text-slate-400 block mb-2 uppercase tracking-wider">
              Ground Floor Clear Height: {groundHeight}m
            </label>
            <input 
              type="range" min="1" max="4" step="0.5" 
              value={groundHeight} 
              onChange={(e) => setGroundHeight(parseFloat(e.target.value))}
              className="w-full accent-blue-500"
            />
          </div>
        </div>

        {/* Core AI Generation Trigger */}
        <button
          onClick={handleAiGeneration}
          disabled={isGenerating}
          className="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-4 rounded-lg transition duration-200 disabled:bg-slate-700 disabled:text-slate-400 text-sm"
        >
          {isGenerating ? 'Rendering AI Elevation...' : 'Generate 3D AI Elevation'}
        </button>
      </div>

      {/* CENTER & RIGHT CANVAS VIEWER FIELDS */}
      <div className="lg:col-span-3 relative bg-slate-950 flex flex-col">
        
        {/* Toggle between 3D Mesh Wireframe Canvas and AI Render View */}
        <div className="absolute top-4 right-4 z-10 flex gap-2">
          <button 
            onClick={() => setGeneratedImage(null)}
            className={`px-3 py-1.5 rounded text-xs font-medium transition ${!generatedImage ? 'bg-blue-600 text-white' : 'bg-slate-800 text-slate-300'}`}
          >
            3D Structure
          </button>
          {generatedImage && (
            <button className="bg-blue-600 text-white px-3 py-1.5 rounded text-xs font-medium">
              AI Reality Render
            </button>
          )}
        </div>

        {/* Dynamic Display Rendering Box */}
        <div className="w-full flex-1 min-h-[450px] relative">
          {generatedImage ? (
            /* AI Render Target output layout */
            <div 
              className="w-full h-full bg-cover bg-center transition-all duration-300"
              style={{ backgroundImage: `url(${generatedImage})` }}
            />
          ) : (
            /* Three.js Interactive 3D Mock Engine Canvas */
            <Canvas camera={{ position: [8, 8, 12], fov: 45 }}>
              <ambientLight intensity={0.6} />
              <pointLight position={[10, 10, 10]} intensity={1.2} />
              
              {/* Recessed Ground Floor (Simulating Glass base footprint) */}
              <Box position={[0, groundHeight / 2, 0]} args={[5, groundHeight, 5]}>
                <meshStandardMaterial color="#334155" wireframe />
              </Box>

              {/* Floating Cantilever Upper Mass (Visualizing the outward projection shift) */}
              <Box 
                position={[cantileverDepth / 2 - 1, groundHeight + 1.5, 0]} 
                args={[5 + (cantileverDepth - 3), 3, 5]}
              >
                <meshStandardMaterial color="#3b82f6" opacity={0.8} transparent />
              </Box>

              <Grid renderOrder={-1} position={[0, 0, 0]} cellSize={1} cellThickness={0.5} sectionSize={5} infiniteGrid />
              <OrbitControls maxPolarAngle={Math.PI / 2 - 0.05} minDistance={5} maxDistance={25} />
            </Canvas>
          )}
        </div>

        {/* Contextual Data Bar */}
        <div className="p-4 bg-slate-900 border-t border-slate-800 flex justify-between items-center text-xs text-slate-400">
          <span>Active Plot Target: <strong className="text-slate-200 capitalize">{locality} Zone</strong></span>
          <span>Mesh Topology: Cantilever Rigged</span>
        </div>
      </div>

    </div>
  );
}
