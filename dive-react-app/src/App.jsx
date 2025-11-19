import {Fragment } from "react";
// import Message from "./message";
import List from "./List";
import TodoList from "./TodoList";

function App() {
  return (
    <Fragment>
      {/* <h1>
        This is a new project
      </h1> */}
       {/* <Message></Message> */}
      {/* <List/> */}
      <TodoList></TodoList>
    </Fragment>
  )
}

export default App
// OR
//  return (
//     <Div>
//       <h1>
//         This is a new project
//       </h1>
//       <p>Message</p>
//     </Div>
//   )

//OR
// return (
//   <>
//     <h1>
//         This is a new project
//       </h1>
//       <p>Message</p>
//   </>
// )
