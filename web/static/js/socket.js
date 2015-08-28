// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "web/static/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/my_app/endpoint.ex":
import {Socket} from "deps/phoenix/web/static/js/phoenix"

let stateSocket = new Socket("/socket");

stateSocket.connect();

let stateChannel = stateSocket.channel("state:"+TEAM_ID, {});
stateChannel.join()
  .receive("ok", resp => { update_state(resp); })
  .receive("error", resp => { console.log("oh noez", resp); });

function update_state(response) {
  console.log(response);
  let state = response.state;
  for (var k in state) {
    let elt = document.getElementById(k);
    if (elt) elt.checked = state[k]==1;
  }
  $("#score").html(response.score);
}

stateChannel.on("update", payload => {
  update_state(payload);
});

$("input.task").on("click", e => {
  let val = $(e.srcElement).is(":checked") ? 1 : 0;
  var payload = {};
  payload[e.srcElement.id] = val;
  stateChannel.push("update", payload);
});




export default stateSocket
