import React from 'react'

function Trips(props) {
  return <div>
    <h3>These are trips from the API</h3>
    {props.trips.map((trip) => {
      return(
        <div key={trip.id}>
          <h2>{trip.title}</h2>
          <p>{trip.description}</p>
          <p><strong>Start Date:</strong>{trip.start_date}</p>
          <p><strong>End Date:</strong>{trip.end_date}</p>
          <br />
        </div>
      ); 
    })}
  </div>;
}

export default Trips;