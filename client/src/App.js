import './App.css';
import {BrowserRouter as Router, Link, Route} from 'react-router-dom'
import Fib from './Fib';
import OtherPage from "./OtherPage";

function App() {
  return (
    <Router>
      <div className="App">
        <header >
          <Link to={'/'}>Home</Link> {'  '}
          <Link to={'/otherpage'}>Other Page</Link>
        </header>
        <h1>Fib Calculator V2</h1>
        <hr/>
        <div>
          <Route exact={true} path={'/'} component={Fib}/>
          <Route path={'/otherpage'} component={OtherPage}/>
        </div>
      </div>
    </Router>

  );
}

export default App;
