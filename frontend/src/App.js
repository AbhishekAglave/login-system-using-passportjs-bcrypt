import "./App.css";

function App() {
  return (
    <div className="App">
      <form className="form" method="POST" action="/signup">
        <label>
          <input type="text" name="username" placeholder="Username"></input>
        </label>
        <label>
          <input type="password" name="password" placeholder="Password"></input>
        </label>
        <button type="submit">Sign up</button>
      </form>
      <form className="form" method="POST" action="/login">
        <label>
          <input type="text" name="username" placeholder="Username"></input>
        </label>
        <label>
          <input type="password" name="password" placeholder="Password"></input>
        </label>
        <button type="submit">Login</button>
      </form>

      <a href="http://localhost:8000/user">see logged in user</a>
      <form method='POST' action="/logout">
      <button type="submit">Logout</button>
      </form>
      <a href="http://localhost:8000/users">see all users</a>
    </div>
  );
}

export default App;
