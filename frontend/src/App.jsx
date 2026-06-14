import { useState } from 'react';
import ProjectList from './components/ProjectList.jsx';
import TaskBoard from './components/TaskBoard.jsx';

export default function App() {
  const [selectedProjectId, setSelectedProjectId] = useState(null);

  return (
    <div className="app">
      <aside className="sidebar">
        <h2>Projects</h2>
        <ProjectList
          selectedProjectId={selectedProjectId}
          onSelect={setSelectedProjectId}
        />
      </aside>
      <main className="board">
        {selectedProjectId ? (
          <TaskBoard projectId={selectedProjectId} />
        ) : (
          <p>Select a project to view its tasks.</p>
        )}
      </main>
    </div>
  );
}
