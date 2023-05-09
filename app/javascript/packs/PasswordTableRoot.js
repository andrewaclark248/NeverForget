import PasswordTable from './../components/PasswordTable'
import React, { Component, useState } from 'react'
import ReactDOM from "react-dom";

function PasswordTableRoot() {

    return (<React.Fragment>
        <PasswordTable />
    </React.Fragment>)

}

const container = document.getElementById('root');

// Create a root.
const root = ReactDOM.createRoot(container);

// Initial render
root.render(<PasswordTableRoot />);
