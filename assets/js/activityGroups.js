export const Groupings = {
  run: () => {
    const newGroupButton = document.querySelector('#new-activity-group');
    const groupsContainer = document.querySelector('#group-maker-container');
    newGroupButton.addEventListener('click', event => {
      groupsContainer.lastElementChild.before(Group().render());
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