import logo from './logo.svg';
import './App.css';
import Words from "./components/words";
import {word_all_list} from "./apis/rails_words/words.js"
import {useEffect, useState} from "react";

const API_URL = "/api/v1/word";
function App() {
  const [words, setWords] = useState([]);

  useEffect(() => {
    get_words();
  },[]);

  async function get_words(){
    try{
      const result = await word_all_list();
      setWords(result.data.data);
    }catch (e){
      console.log(e)
    }
  }

  return (
    <div className="App">
      <h1>Hello</h1>
      {words.map((i)=>{
        return(
            <div>
              <p>{i.NO}</p>
              <p>{i.WORD}</p>
            </div>
            )
      })}
    </div>
  );
}

export default App;
