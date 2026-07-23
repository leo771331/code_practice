def solution(today, terms, privacies):
    answer = []

    def convert_date(date):
        year, month, day = map(int, date.split("."))
        return year * 12 * 28 + month * 28 + day

    today_date = convert_date(today)

    term_dict = {}

    for term in terms:
        term_type, month = term.split()
        term_dict[term_type] = int(month)

    for index, privacy in enumerate(privacies, start=1):
        collected_date, term_type = privacy.split()

        expire_date = (
            convert_date(collected_date)
            + term_dict[term_type] * 28
        )

        if expire_date <= today_date:
            answer.append(index)

    return answer