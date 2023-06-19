import './App.css';
import axios from "axios";
import Trips from "./components/trips";
import { useEffect, useState } from 'react';

const API_URL = "http://localhost:3000/api/v1/trips";

function getAPIData() {
  return axios.get(API_URL).then((response) => response.data);
}

function App() {
  const [trips, setTrips] = useState([]);

  useEffect(() => {
    let mounted = true;
    getAPIData().then((items) => {
      if (mounted) {
        setTrips(items);
      }
    });
    return () => (mounted = false);
  }, []);
  
  return (
    <div className="App">
      <h1>Your Trips</h1>
      <Trips trips={trips} />
    </div>
  );
}

export default App;
