import React from 'react';
import Navigation from './navigation/Navigation'

const Organisms = () => {
  return (
    <div>
      <h2> Navigation </h2>
      <Navigation
        links={[
          "Technical Articles",
          "Blog Posts",
          "Origami",
          "Resume"
        ]}
      />
    </div>
  )
};

export default Organisms;
