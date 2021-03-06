string {
	repeatChar(ch char, count int) {
		rb := StringBuilder{}
		for i := 0; i < count {
			rb.writeChar(ch)
		}
		return rb.compactToString()
	}

	split(s string, sep char) {
		num := 1
		for i := 0; i < s.length {
			if s[i] == sep {
				num += 1
			}
		}
		result := Array<string>(num)
		from := 0
		j := 0
		for i := 0; i < s.length {
			if s[i] == sep {
				result[j] = s.slice(from, i)
				from = i + 1
				j += 1
			}
		}
		result[j] = s.slice(from, s.length)
		return result		
	}
	
	join(sep string, items Array<string>) {
		rb := StringBuilder{}
		insertSep := false
		for items {
			if insertSep {
				rb.write(sep)
			} else {
				insertSep = true
			}
			rb.write(it)
		}
		return rb.compactToString()
	}

	startsWith(s string, prefix string) {
		if s.length < prefix.length {
			return false
		}
		for i := 0; i < prefix.length {
			if s[i] != prefix[i] {
				return false
			}
		}
		return true
	}
	
	replace(s string, sub string, replacement string) {
		rb := StringBuilder{}
		last := 0
		for i := 0; i < s.length {
			j := i
			k := 0
			while k < sub.length {
				if s[j] == sub[k] {
					j += 1
					k += 1
				} else {
					break
				}
			}
			if k == sub.length {
				rb.write(s.slice(last, i))
				rb.write(replacement)
				i += sub.length
				last = i
			} else {
				i += 1
			}
		}
		rb.write(s.slice(last, s.length))
		return rb.compactToString()
	}
	
	indexOfChar(s string, ch char) {
		for i := 0; i < s.length {
			if s[i] == ch {
				return i
			}
		}
		return -1
	}
}
