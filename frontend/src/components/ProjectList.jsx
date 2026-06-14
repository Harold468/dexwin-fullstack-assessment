import { useEffect, useState } from 'react';
import { getProjects } from '../api/client.js';

export default function ProjectList({ selectedProjectId, onSelect }) {
  const [projects, setProjects] = useState([]);

  useEffect(() => {
    getProjects().then(setProjects);
  }, []);

  return (
    <div>
      {projects.map((project) => (
        <div
          key={project.id}
          className={
            'project-item' + (project.id === selectedProjectId ? ' active' : '')
          }
          onClick={() => onSelect(project.id)}
        >
          {project.name}
        </div>
      ))}
    </div>
  );
}
