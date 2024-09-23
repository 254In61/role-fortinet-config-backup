# role-fortios-config-backup
Role contains tasks that perform config backup of fortios devices

# Requirements
- Minimum ansible 2.11

# Role Variables

- Variables are fed into the role during the play.

- Varibles are set in all.yml file

# Dependencies
- Playbook with variables.

# Example Playbook

Ref: appc-config-backup


# How to use
- See example below

## example vars file

! all-vars.yml
---
fortios_git_repo_dir: fortios

fortios_vdom: root

git_user: "{{ lookup('env', 'ANSIBLE_NET_USERNAME') }}"

git_pwd: "{{ lookup('env', 'ANSIBLE_NET_PASSWORD') }}"

git_user_email: amaseghe@redhat.com

root_dir: /tmp

repo_dir: network-devices-configs-backup-store

namespace: redhat

git_repo: "https://{{ git_user }}:{{ git_pwd }}@gitlab.vodafone.com.au/{{ namespace }}/{{ repo_dir }}.git"
...

## example playbook 
---

- name: Backup fortios configurations

  hosts: appc_fortigate_vfwl

  gather_facts: false

  vars:

    cmd: show

tasks:

    - name: Set file operations facts

      ansible.builtin.set_fact:

        tmp_config_store: "{{ root_dir }}/{{ config_backup_file }}"

        tmp_config_store: "{{ root_dir }}/{{ config_backup_file }}"

        git_repo_vendor_dir: "{{ fortios_git_repo_dir }}"

      delegate_to: localhost

     - name: Import role-fortios-config-backup role

      ansible.builtin.import_role:

        name: role-fortios-config-backup

      vars:

        fortios: true

   
    - name: Import role-gitlab-config-backup-upload - upload running config backup

      ansible.builtin.import_role:

        name: role-gitlab-config-backup-upload

      vars:

        normal_file: true

        large_file: false


  post_tasks:

    - name: Debug out results

      ansible.builtin.debug:

        msg:

          - "configuration backup tasks completed"
          
      delegate_to: localhost
...


# License
BSD

# Author Information
Name : Allan Maseghe

Company: Red Hat

Role: Consultant - Ansible
