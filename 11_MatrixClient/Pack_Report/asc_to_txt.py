import os

# ********************************************************
BASE_DIR = r'C:\Users\peng.chen_18084\Desktop\test'


# ********************************************************

def run():
    add = os.getcwd()

    res = os.walk(BASE_DIR)
    for root, dirs, files in res:
        for i in files:
            if i.endswith('asc'):
                name = os.path.basename(BASE_DIR + '/' + i).split('.')[0]
                with open(BASE_DIR + '/' + i, 'rt', encoding='utf-8') as f:
                    ll = f.readline()
                    month = ''
                    day = ll.split()[3]
                    year = ll.split()[6]
                    hour = ll.split()[4][:2]
                    mint = ll.split()[4][3:5]
                    upd = ll.split()[5]
                    if ll.split()[2] == 'Jan':
                        month = '1'
                    elif ll.split()[2] == 'Feb':
                        month = '2'
                    elif ll.split()[2] == 'Mar':
                        month = '3'
                    elif ll.split()[2] == 'Apr':
                        month = '4'
                    elif ll.split()[2] == 'May':
                        month = '5'
                    elif ll.split()[2] == 'Jun':
                        month = '6'
                    elif ll.split()[2] == 'Jul':
                        month = '7'
                    elif ll.split()[2] == 'Aug':
                        month = '8'
                    elif ll.split()[2] == 'Sep':
                        month = '9'
                    elif ll.split()[2] == 'Oct':
                        month = '10'
                    elif ll.split()[2] == 'Nov':
                        month = '11'
                    elif ll.split()[2] == 'Dec':
                        month = '12'
                    with open('%s%s%s.txt' % (
                            add, '/asc_to_txt/asc_to_txt_AscDate/',
                            year + '_' + month + '_' + day + '_' + upd + '_' + hour + mint + '_' + name),
                              'wt',
                              encoding='utf-8') as f:
                        f.write(ll)


if __name__ == '__main__':
    if not os.path.exists('%s/%s' % ('asc_to_txt', 'asc_to_txt_AscDate')):
        os.makedirs('%s/%s' % ('asc_to_txt', 'asc_to_txt_AscDate'))
    run()
