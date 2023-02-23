import React from "react";

function Words(props){
  return(
    <div>
      <h1>This words are from the api</h1>
      {props.words.map((word)=>{
        return
        <div key={word.no}>
          <p>{word.word}</p>
        </div>
      })}
    </div>
  )
}

export  default Words