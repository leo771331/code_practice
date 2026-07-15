from collections import deque

def solution(maps):
    n = len(maps)
    m = len(maps[0])

    visited = [[False] * m for _ in range(n)]
    answer = []

    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]

    for i in range(n):
        for j in range(m):

            if maps[i][j] == 'X' or visited[i][j]:
                continue

            q = deque([(i, j)])
            visited[i][j] = True
            total = int(maps[i][j])

            while q:
                x, y = q.popleft()

                for k in range(4):
                    nx = x + dx[k]
                    ny = y + dy[k]

                    if 0 <= nx < n and 0 <= ny < m:
                        if not visited[nx][ny] and maps[nx][ny] != 'X':
                            visited[nx][ny] = True
                            total += int(maps[nx][ny])
                            q.append((nx, ny))

            answer.append(total)

    return sorted(answer) if answer else [-1]