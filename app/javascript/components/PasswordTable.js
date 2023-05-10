import React, { Component, useState } from 'react'

function PasswordTable() {


    return (
    <React.Fragment>
        <div className="list-group rounded-0 border-top border-secondary" >

            <div className="list-group-item border-0" style={{backgroundColor: "#F8F8F8"}} >
                <div className=" pb-3 pt-2" style={{display: "flex"}}>
                    <div className="" style={{marginRight: "20px"}}>
                        <span className="fw-bold">Search Credentials By:</span>
                    </div>

                    <div className="input-group-sm">

                        <input type="radio" className="btn-check " name="options-outlined" id="danger-outlined" autoComplete="off"  />
                        <label className="btn btn-outline-primary m-1" htmlFor="danger-outlined">Url's</label>

                        
                        <input type="radio" className="btn-check" name="options-outlined" id="usernmae" autoComplete="off" />
                        <label className="btn btn-outline-primary m-1" htmlFor="usernmae">Username</label>
                    
                        <input type="radio" className="btn-check" name="options-outlined" id="password" autoComplete="off" />
                        <label className="btn btn-outline-primary m-1" htmlFor="password">Password</label>

                        <input type="radio" className="btn-check" name="options-outlined" id="insecure-password" autoComplete="off" />
                        <label className="btn btn-outline-warning m-1" htmlFor="insecure-password">Insecure Passwords</label>

                        <input type="radio" className="btn-check" name="options-outlined" id="compromised-password" autoComplete="off" />
                        <label className="btn btn-outline-danger m-1" htmlFor="compromised-password">Compromised Passwords</label>
                        
                        <input type="radio" className="btn-check" name="options-outlined" id="compromised-usernames" autoComplete="off" />
                        <label className="btn btn-outline-danger m-1" htmlFor="compromised-usernames">Compromised Usernames</label>
                    </div>


                </div>


                <div className="row pb-2">
                    <div className="col-3">
                        <small>
                        <div className="input-group-sm">
                            <input className="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Search" />
                        </div>
                        </small>
                    </div>
                    <div className="col-4">
                        <div className="d-grid gap-2">
                        </div>
                    </div>
		        </div>
            </div>


            <div className="list-group-item accordion-bg" >
                <div className="row pb-1 pt-1">
                    <div className="col-5">
                        <span className="fw-bold ps-3">Username</span>
                    </div>
                    <div className="col-2">
                        <span className="fw-bold">URL's</span>
                    </div>
                    <div className="col-3">
                        <span className="fw-bold">Password Strength</span>
                    </div>
                    <div className="col-1">
                        <span className="fw-bold">Edit</span>
                    </div>
                    <div className="col-1">
                        <span className="fw-bold">Delete</span>
                    </div>
                </div>
            </div>


        </div>
    </React.Fragment>
    )
}

export default PasswordTable;