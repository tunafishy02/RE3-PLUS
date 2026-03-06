import { useState } from "react";

function App() {
  const [message, setMessage] = useState("Welcome to Re3 Plus!");

  return (
    <div className="flex flex-col min-h-screen bg-slate-950 text-slate-100">
      {/* Header */}
      <header className="p-6 text-center border-b border-slate-700">
        <h1 className="text-4xl font-bold text-ecoGreen">Re3 Plus AI Simulator</h1>
        <p className="text-slate-400">Your local demo is running 🎉</p>
      </header>

      {/* Three Panels */}
      <main className="flex flex-1">
        <section className="flex-1 p-6 border-r border-slate-800">
          <h2 className="text-xl font-semibold mb-2">Panel 1</h2>
          <p>Scanner / Camera integration goes here.</p>
        </section>

        <section className="flex-1 p-6 border-r border-slate-800">
          <h2 className="text-xl font-semibold mb-2">Panel 2</h2>
          <p>Firebase data or AI responses go here.</p>
        </section>

        <section className="flex-1 p-6">
          <h2 className="text-xl font-semibold mb-2">Panel 3</h2>
          <p>{message}</p>
          <button
            className="mt-4 px-4 py-2 bg-ecoGreen text-slate-900 rounded hover:bg-ecoGreen/80"
            onClick={() => setMessage("You clicked the button!")}
          >
            Test Button
          </button>
        </section>
      </main>

      {/* Footer */}
      <footer className="p-4 text-center border-t border-slate-700 text-slate-400">
        Running on localhost:5173
      </footer>
    </div>
  );
}

export default App;