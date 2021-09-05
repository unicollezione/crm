import React, {useState, useEffect} from 'react';
import PropTypes from 'prop-types';
// eslint-disable-next-line no-unused-vars
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';

const Items = () => {
  const [items, setItems] = useState([]);

  useEffect(() => {
    const url = '/api/items';

    const fetchItems = async () => {
      try {
        const response = await fetch(url);
        const json = await response.json();
        setItems(json)
      } catch (error) {
        console.warn('error', error);
      }
    };

    fetchItems();
  }, []);

  return (
    <React.Fragment>
      <div className='container'>
        <div className='pt-3'>
        </div>
        <div className='display-3'>
          <div className='display-3'>
            Items: {items.map((item) => {
              return <p key={item.created_at}> {item.name} </p> })
            }
          </div>
        </div>
      </div>
    </React.Fragment>
  );
};

Items.propTypes = {
  items: PropTypes.object,
};

export default Items;
