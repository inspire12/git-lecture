
def init_git():
    print('git init')

def add_to_stage(file_path):
    print(f'git add {file_path}')

def add_all_commit():
    print('git commit')

def add_all_commit_message_option(message):
    print(f'git commit -m {message}')

def add_ignore():
    add_to_stage('.gitignore')
    add_all_commit_message_option('feat: add .gitignore')

def add_to_stage_with_patch():
    print('git add -p')

def add_all_to_stage():
    print('git add .')





if __name__ == '__main__':
    print('Hello Git!')
    init_git()
    add_to_stage('git-step.py')
    add_ignore()

