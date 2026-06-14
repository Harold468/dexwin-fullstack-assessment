export default function TaskItem({ task, onToggle }) {
  return (
    <div className={'task-card' + (task.status === 'DONE' ? ' done' : '')}>
      <div>
        <strong>{task.name}</strong>
        <div>
          <span className="status-badge">{task.status}</span>
        </div>
      </div>
      <button onClick={() => onToggle(task)}>
        {task.status === 'DONE' ? 'Reopen' : 'Complete'}
      </button>
    </div>
  );
}
