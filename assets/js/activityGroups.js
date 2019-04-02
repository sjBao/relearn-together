import uikitjs from 'uikit';
export const Groupings = {
  run: () => {
    const groupsContainer = GroupsContainer(location.pathname.split('/')[4]);
    groupsContainer.initalize()

    uikitjs.util.on('#group-maker-container', 'added', (item, two, three) => {
      console.log(item);
    })
    uikitjs.util.on('#group-maker-container', 'removed', (item, two, three) => {
      console.log(item);
    })
  }
}

const GroupsContainer = (activity_id) => {
  const groupsContainer = document.querySelector('#group-maker-container');
  const newGroupButton = document.querySelector('#new-activity-group');
  const groupsAdapter = GroupsAdapter(activity_id);
  let groupNumber = 1;

  function initalize() {
    groupsAdapter.fetchGroups().then(groups => {
      groups.forEach(renderGroup);
    });
    newGroupButton.addEventListener('click', createGroup);
  }

  function createGroup() {
    groupsAdapter.createGroup().then(renderGroup)
  }

  function renderGroup(group) {
    groupsContainer.lastElementChild.before(GroupCard(group, groupNumber++));
  }

  return {
    initalize
  }


}

const GroupsAdapter = (activity_id) => {
  const url = `/api/activities/${activity_id}/groups`;
  const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  
  const fetchGroups = () => fetch(url).then(response => response.json())
  const createGroup = () => fetch(url, {
    method: 'POST',
    headers,
    body: JSON.stringify({activity_id})
  }).then(response => response.json())

  return {
    fetchGroups, createGroup
  }
}


const GroupCard = (group, number) => {
  const node = document.createElement('template');
  node.innerHTML = `
<div data-group-id="${group.id}" class="group-card uk-width-1-3">
  <h4>Group ${number}</h4>
  <div uk-sortable="group: sortable-group" class="groupings">
  </div>
</div>`;

  return node.content.firstElementChild;
}

const Student = () => {
  const render = () => `
    <div class="sortable-student-card">
      <div class="">Item 1</div>
    </div>
  `
}