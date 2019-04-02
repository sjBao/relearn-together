import uikitjs from 'uikit';
export const Groupings = {
  run: () => {
    const newGroupButton = document.querySelector('#new-activity-group');
    const groupsContainer = document.querySelector('#group-maker-container');
    uikitjs.util.on('#group-maker-container', 'added', (item, two, three) => {
      console.log(item);
    })
    uikitjs.util.on('#group-maker-container', 'removed', (item, two, three) => {
      console.log(item);
    })
    newGroupButton.addEventListener('click', event => {
      console.log(location.pathname.split('/')[4])
      fetch("/api/activities/:activity_id/groups", {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: JSON.stringify({
          activity_id: 17
        })
      })
        .then(response => {
          console.log(response)
          return response.json()
        })
        .then(data => {
          console.log(data)
          groupsContainer.lastElementChild.before(Group().render());
        })

    })
  }
}


const Group = () => {
  const node = document.createElement('template');
  const render = () => {
    node.innerHTML = `
<div class="group-card uk-width-1-3">
  <h4>Group 1</h4>
  <div uk-sortable="group: sortable-group" class="groupings">
  </div>
</div>`;
    return node.content;
  }

  return {
    render
  }
}

const Student = () => {
  const render = () => `
    <div class="sortable-student-card">
      <div class="">Item 1</div>
    </div>
  `
}