def roll_to_east(dice):
    new_dice = [0, 0, 0, 0, 0, 0]
    new_dice[0] = dice[5]
    new_dice[1] = dice[0]
    new_dice[2] = dice[1]
    new_dice[3] = dice[3]
    new_dice[4] = dice[4]
    new_dice[5] = dice[2]
    return new_dice


def roll_to_west(dice):
    new_dice = [0, 0, 0, 0, 0, 0]
    new_dice[0] = dice[1]
    new_dice[1] = dice[2]
    new_dice[2] = dice[5]
    new_dice[3] = dice[3]
    new_dice[4] = dice[4]
    new_dice[5] = dice[0]
    return new_dice


def roll_to_south(dice):
    new_dice = [0, 0, 0, 0, 0, 0]
    new_dice[0] = dice[0]
    new_dice[1] = dice[3]
    new_dice[2] = dice[2]
    new_dice[3] = dice[5]
    new_dice[4] = dice[1]
    new_dice[5] = dice[4]
    return new_dice


def roll_to_north(dice):
    new_dice = [0, 0, 0, 0, 0, 0]
    new_dice[0] = dice[0]
    new_dice[1] = dice[4]
    new_dice[2] = dice[2]
    new_dice[3] = dice[1]
    new_dice[4] = dice[5]
    new_dice[5] = dice[3]
    return new_dice


input_values = input().split()
n, m, total_roll = map(int, input_values[0:3])
map_data = []

for _ in range(n):
    map_row = list(map(int, input().split()))
    map_data.append(map_row)

now = (0, 0)
dice = [4, 1, 3, 2, 5, 6]

directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]  # 동남서북
di = 0
roll = 0
score = 0

while roll < total_roll:
    next_pos = (now[0] + directions[di][0], now[1] + directions[di][1])

    if 0 <= next_pos[0] < n and 0 <= next_pos[1] < m:
        di += 0
    else:
        di = (di + 2) % 4  # 방향 반대로
        next_pos = (now[0] + directions[di][0], now[1] + directions[di][1])

    now = next_pos

    if di == 0:
        dice = roll_to_east(dice)
    elif di == 1:
        dice = roll_to_south(dice)
    elif di == 2:
        dice = roll_to_west(dice)
    elif di == 3:
        dice = roll_to_north(dice)

    below = dice[5]
    board_num = map_data[now[0]][now[1]]

    queue = [now]
    count = 1
    visited = [[False] * m for _ in range(n)]
    visited[now[0]][now[1]] = True

    while queue:
        now_node = queue.pop(0)

        for idx in range(4):
            nr = now_node[0] + directions[idx][0]
            nc = now_node[1] + directions[idx][1]

            if 0 <= nr < n and 0 <= nc < m and map_data[nr][nc] == board_num and not visited[nr][nc]:
                visited[nr][nc] = True
                count += 1
                queue.append((nr, nc))

    score += count * board_num

    if board_num < below:
        di = (di + 1) % 4
    elif board_num > below:
        di = (di + 3) % 4
    else:
        di += 0

    roll += 1

print(score)
