import PasswordTable from './../components/PasswordTable'
import React, { Component, useState } from 'react'
import ReactDOM from "react-dom/client";

function PasswordTableRoot() {

    return (<React.Fragment>
        <PasswordTable />
    </React.Fragment>)

}

const container = document.getElementById('password-table');

// Create a root.
const root = ReactDOM.createRoot(container);

// Initial render
root.render(<PasswordTableRoot />);
