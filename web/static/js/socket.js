// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "web/static/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/my_app/endpoint.ex":
import {Socket} from "deps/phoenix/web/static/js/phoenix"

let stateSocket = new Socket("/socket");

stateSocket.connect();

let stateChannel = stateSocket.channel("state:0", {});
stateChannel.join()
  .receive("ok", resp => {
    console.log("oh yeah", resp.state);
    update_state(resp.state);
  })
  .receive("error", resp => { console.log("oh noez", resp); });

function update_state(state) {
  for (var k in state) {
    let elt = document.getElementById(k);
    if (elt) elt.checked = state[k]==1;
  }
}

stateChannel.on('update', payload => {
  console.log(payload);
  update_state(payload);
});

$('input.task').on('click', e => {
  let val = $(e.srcElement).is(":checked") ? 1 : 0;
  var payload = {};
  payload[e.srcElement.id] = val;
  stateChannel.push('update', payload);
  console.log(val);
});




export default stateSocket
