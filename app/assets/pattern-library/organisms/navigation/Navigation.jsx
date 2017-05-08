import React from 'react';
import PropTypes from 'prop-types';

const propTypes = {
  links: PropTypes.array.isRequired
};

const Navigation = ({
  links
}) => {
  return (
    <div>
      {
        links.map((link, i) => (
          <a key={i}>
            {link}
          </a>
        ))
      }
    </div>
  )
}

Navigation.propTypes = propTypes;

export default Navigation;
