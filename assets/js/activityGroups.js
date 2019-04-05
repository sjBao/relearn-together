import uikitjs from 'uikit';
export const Groupings = {
  run: () => {
    const groupsContainer = GroupsContainer(location.pathname.split('/')[4]);
    groupsContainer.initalize();
  }
}

const GroupsContainer = (activity_id) => {
  const groupsContainer = document.querySelector('#group-maker-container');
  const ungroupedStudentsContainer = groupsContainer.querySelector('#ungrouped-students')
  const groupsAdapter = GroupsAdapter(activity_id);
  let groupNumber = document.querySelectorAll('.group-card').length;

  function initalize() {
    // groupsAdapter.fetchGroups().then(groups => {
    //   groups.forEach(renderGroup);
    // });
    uikitjs.util.on('#new-activity-group', 'click', createGroup);

    uikitjs.util.on('#group-maker-container', 'click', event => {
      if (event.target.closest('.delete-group-button')) {
        const groupCard = event.target.closest('.group-card');
        const orphanedStudents = groupCard.querySelectorAll('.sortable-student-card');

        ungroupedStudentsContainer.append(...orphanedStudents);
        deleteGroup(groupCard);
      }
    })

    uikitjs.util.on('#group-maker-container', 'added', event => {
      console.log("updating group...")
      const groupCard = event.target.closest('.group-card');
      if (groupCard) {
        const groupId = groupCard.getAttribute('data-group-id');
        const studentNode = event.detail[1];
        groupsAdapter.updateGroup(groupId, parseStudentNode(studentNode))
          .then(response => response)
      }
    })


    // uikitjs.util.on('#group-maker-container', 'removed', event => {
    //   console.log(event.target);
    // })
  }

  function createGroup() {
    groupsAdapter.createGroup().then(renderGroup)
  }

  function renderGroup(group) {
    groupsContainer.lastElementChild.before(GroupCard(group, groupNumber++));
  }

  function deleteGroup(groupNode) {
    const groupId = groupNode.getAttribute('data-group-id');
    groupsAdapter.deleteGroup(groupId).then(unmountGroup)
  }

  function unmountGroup(group) {
    groupsContainer.querySelector(`[data-group-id="${group.id}"]`).remove();
    groupNumber--;
  }

  function parseStudentNode(student) {
    return ({
      student_id: student.getAttribute('data-student-id'),
      name: student.querySelector('.student-name').innerText
    })
  }


  return { initalize }


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
    body: JSON.stringify({ activity_id })
  }).then(response => handleResponse(response, "Group Created", "primary"));

  const deleteGroup = (groupId) => fetch(url + `/${groupId}`, {
    method: 'DELETE'
  }).then(response => handleResponse(response, "Group Deleted", "primary"));

  const updateGroup = (groupId, payload) => fetch(url + `/${groupId}`, {
    method: 'PATCH',
    headers,
    body: JSON.stringify(payload)
  }).then(response => handleResponse(response, "Group Updated", "primary"));

  const handleResponse = (response, message = 'Saved!', status = '') => {
    if (response.ok) {
      uikitjs.notification({
        message:`<div class="uk-text-center">${message}</div>`,
        status,
        timeout: 800,
        pos: 'top-left'
      });
      return response.json()
    }
  }

  return {
    fetchGroups, createGroup, deleteGroup, updateGroup
  }
}


const GroupCard = (group, number) => {
  const node = document.createElement('template');
  node.innerHTML = `
<div data-group-id="${group.id}" class="group-card uk-width-1-3">
  <h4>Group ${number} <span class="uk-icon delete-group-button" uk-icon="icon: trash"></span></h4>
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