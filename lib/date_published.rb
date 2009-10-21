# Autogenerated from a Treetop grammar. Edits may be lost.


module DatePublished
  include Treetop::Runtime

  def root
    @root || :date
  end

  module Date0
    def to_date; f = to_h; Date.new(f[:year], f[:month] || 1, f[:day] || 1); end; def season?; to_h.has_key?(:season); end
  end

  module Date1
    def to_date; f = to_h; Date.new(f[:year], f[:month] || 1, f[:day] || 1); end; def season?; to_h.has_key?(:season); end
  end

  def _nt_date
    start_index = index
    if node_cache[:date].has_key?(index)
      cached = node_cache[:date][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_date_range
    r1.extend(Date0)
    if r1
      r0 = r1
    else
      r2 = _nt_absolute_date
      r2.extend(Date1)
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:date][start_index] = r0

    r0
  end

  module DateRange0
    def year_range
      elements[0]
    end

    def space
      elements[1]
    end

    def season_range
      elements[2]
    end
  end

  module DateRange1
    def to_h; year_range.to_h.merge(season_range.to_h); end
  end

  module DateRange2
    def year_range
      elements[0]
    end

    def space
      elements[1]
    end

    def season
      elements[2]
    end
  end

  module DateRange3
    def to_h; year_range.to_h.merge(season.to_h); end
  end

  module DateRange4
    def year
      elements[0]
    end

    def space
      elements[1]
    end

    def season_range
      elements[2]
    end
  end

  module DateRange5
    def to_h; year.to_h.merge(season_range.to_h); end
  end

  module DateRange6
    def year
      elements[0]
    end

    def space
      elements[1]
    end

    def month_range
      elements[2]
    end
  end

  module DateRange7
    def to_h; year.to_h.merge(month_range.to_h); end
  end

  module DateRange8
    def year
      elements[0]
    end

    def space
      elements[1]
    end

    def day_range
      elements[2]
    end
  end

  module DateRange9
    def to_h; year.to_h.merge(day_range.to_h); end
  end

  def _nt_date_range
    start_index = index
    if node_cache[:date_range].has_key?(index)
      cached = node_cache[:date_range][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_year_range
    s1 << r2
    if r2
      r3 = _nt_space
      s1 << r3
      if r3
        r4 = _nt_season_range
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(DateRange0)
      r1.extend(DateRange1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i5, s5 = index, []
      r6 = _nt_year_range
      s5 << r6
      if r6
        r7 = _nt_space
        s5 << r7
        if r7
          r8 = _nt_season
          s5 << r8
        end
      end
      if s5.last
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        r5.extend(DateRange2)
        r5.extend(DateRange3)
      else
        @index = i5
        r5 = nil
      end
      if r5
        r0 = r5
      else
        r9 = _nt_year_range
        if r9
          r0 = r9
        else
          i10, s10 = index, []
          r11 = _nt_year
          s10 << r11
          if r11
            r12 = _nt_space
            s10 << r12
            if r12
              r13 = _nt_season_range
              s10 << r13
            end
          end
          if s10.last
            r10 = instantiate_node(SyntaxNode,input, i10...index, s10)
            r10.extend(DateRange4)
            r10.extend(DateRange5)
          else
            @index = i10
            r10 = nil
          end
          if r10
            r0 = r10
          else
            i14, s14 = index, []
            r15 = _nt_year
            s14 << r15
            if r15
              r16 = _nt_space
              s14 << r16
              if r16
                r17 = _nt_month_range
                s14 << r17
              end
            end
            if s14.last
              r14 = instantiate_node(SyntaxNode,input, i14...index, s14)
              r14.extend(DateRange6)
              r14.extend(DateRange7)
            else
              @index = i14
              r14 = nil
            end
            if r14
              r0 = r14
            else
              i18, s18 = index, []
              r19 = _nt_year
              s18 << r19
              if r19
                r20 = _nt_space
                s18 << r20
                if r20
                  r21 = _nt_day_range
                  s18 << r21
                end
              end
              if s18.last
                r18 = instantiate_node(SyntaxNode,input, i18...index, s18)
                r18.extend(DateRange8)
                r18.extend(DateRange9)
              else
                @index = i18
                r18 = nil
              end
              if r18
                r0 = r18
              else
                r22 = _nt_absolute_date_range
                if r22
                  r0 = r22
                else
                  @index = i0
                  r0 = nil
                end
              end
            end
          end
        end
      end
    end

    node_cache[:date_range][start_index] = r0

    r0
  end

  module AbsoluteDate0
    def year
      elements[0]
    end

    def space1
      elements[1]
    end

    def month
      elements[2]
    end

    def space2
      elements[3]
    end

    def day
      elements[4]
    end
  end

  module AbsoluteDate1
    def to_h; year.to_h.merge(month.to_h.merge(day.to_h)); end
  end

  module AbsoluteDate2
    def year
      elements[0]
    end

    def space
      elements[1]
    end

    def month
      elements[2]
    end
  end

  module AbsoluteDate3
    def to_h; year.to_h.merge(month.to_h) end
  end

  module AbsoluteDate4
    def year
      elements[0]
    end

    def space
      elements[1]
    end

    def season
      elements[2]
    end
  end

  module AbsoluteDate5
    def to_h; year.to_h.merge(season.to_h) end
  end

  def _nt_absolute_date
    start_index = index
    if node_cache[:absolute_date].has_key?(index)
      cached = node_cache[:absolute_date][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_year
    s1 << r2
    if r2
      r3 = _nt_space
      s1 << r3
      if r3
        r4 = _nt_month
        s1 << r4
        if r4
          r5 = _nt_space
          s1 << r5
          if r5
            r6 = _nt_day
            s1 << r6
          end
        end
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(AbsoluteDate0)
      r1.extend(AbsoluteDate1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i7, s7 = index, []
      r8 = _nt_year
      s7 << r8
      if r8
        r9 = _nt_space
        s7 << r9
        if r9
          r10 = _nt_month
          s7 << r10
        end
      end
      if s7.last
        r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
        r7.extend(AbsoluteDate2)
        r7.extend(AbsoluteDate3)
      else
        @index = i7
        r7 = nil
      end
      if r7
        r0 = r7
      else
        i11, s11 = index, []
        r12 = _nt_year
        s11 << r12
        if r12
          r13 = _nt_space
          s11 << r13
          if r13
            r14 = _nt_season
            s11 << r14
          end
        end
        if s11.last
          r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
          r11.extend(AbsoluteDate4)
          r11.extend(AbsoluteDate5)
        else
          @index = i11
          r11 = nil
        end
        if r11
          r0 = r11
        else
          r15 = _nt_year
          if r15
            r0 = r15
          else
            @index = i0
            r0 = nil
          end
        end
      end
    end

    node_cache[:absolute_date][start_index] = r0

    r0
  end

  module AbsoluteDateRange0
    def absolute_date1
      elements[0]
    end

    def hyphen
      elements[1]
    end

    def absolute_date2
      elements[2]
    end
  end

  module AbsoluteDateRange1
    def to_h; elements.first.to_h; end
  end

  def _nt_absolute_date_range
    start_index = index
    if node_cache[:absolute_date_range].has_key?(index)
      cached = node_cache[:absolute_date_range][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_absolute_date
    s0 << r1
    if r1
      r2 = _nt_hyphen
      s0 << r2
      if r2
        r3 = _nt_absolute_date
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(AbsoluteDateRange0)
      r0.extend(AbsoluteDateRange1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:absolute_date_range][start_index] = r0

    r0
  end

  module YearRange0
    def year1
      elements[0]
    end

    def hyphen
      elements[1]
    end

    def year2
      elements[2]
    end
  end

  module YearRange1
    def to_h; elements.first.to_h; end
  end

  def _nt_year_range
    start_index = index
    if node_cache[:year_range].has_key?(index)
      cached = node_cache[:year_range][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_year
    s0 << r1
    if r1
      r2 = _nt_hyphen
      s0 << r2
      if r2
        r3 = _nt_year
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(YearRange0)
      r0.extend(YearRange1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:year_range][start_index] = r0

    r0
  end

  module SeasonRange0
    def season1
      elements[0]
    end

    def hyphen
      elements[1]
    end

    def season2
      elements[2]
    end
  end

  module SeasonRange1
    def to_h; elements.first.to_h; end
  end

  def _nt_season_range
    start_index = index
    if node_cache[:season_range].has_key?(index)
      cached = node_cache[:season_range][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_season
    s0 << r1
    if r1
      r2 = _nt_hyphen
      s0 << r2
      if r2
        r3 = _nt_season
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(SeasonRange0)
      r0.extend(SeasonRange1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:season_range][start_index] = r0

    r0
  end

  module MonthRange0
    def month1
      elements[0]
    end

    def hyphen
      elements[1]
    end

    def month2
      elements[2]
    end
  end

  module MonthRange1
    def to_h; elements.first.to_h; end
  end

  def _nt_month_range
    start_index = index
    if node_cache[:month_range].has_key?(index)
      cached = node_cache[:month_range][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_month
    s0 << r1
    if r1
      r2 = _nt_hyphen
      s0 << r2
      if r2
        r3 = _nt_month
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(MonthRange0)
      r0.extend(MonthRange1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:month_range][start_index] = r0

    r0
  end

  module DayRange0
    def month
      elements[0]
    end

    def space
      elements[1]
    end

    def day1
      elements[2]
    end

    def hyphen
      elements[3]
    end

    def day2
      elements[4]
    end
  end

  module DayRange1
    def to_h; month.to_h.merge( elements[2].to_h ); end
  end

  module DayRange2
    def month1
      elements[0]
    end

    def space1
      elements[1]
    end

    def day1
      elements[2]
    end

    def hyphen
      elements[3]
    end

    def month2
      elements[4]
    end

    def space2
      elements[5]
    end

    def day2
      elements[6]
    end
  end

  module DayRange3
    def to_h; elements.first.to_h.merge( elements[2].to_h ); end
  end

  def _nt_day_range
    start_index = index
    if node_cache[:day_range].has_key?(index)
      cached = node_cache[:day_range][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_month
    s1 << r2
    if r2
      r3 = _nt_space
      s1 << r3
      if r3
        r4 = _nt_day
        s1 << r4
        if r4
          r5 = _nt_hyphen
          s1 << r5
          if r5
            r6 = _nt_day
            s1 << r6
          end
        end
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(DayRange0)
      r1.extend(DayRange1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i7, s7 = index, []
      r8 = _nt_month
      s7 << r8
      if r8
        r9 = _nt_space
        s7 << r9
        if r9
          r10 = _nt_day
          s7 << r10
          if r10
            r11 = _nt_hyphen
            s7 << r11
            if r11
              r12 = _nt_month
              s7 << r12
              if r12
                r13 = _nt_space
                s7 << r13
                if r13
                  r14 = _nt_day
                  s7 << r14
                end
              end
            end
          end
        end
      end
      if s7.last
        r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
        r7.extend(DayRange2)
        r7.extend(DayRange3)
      else
        @index = i7
        r7 = nil
      end
      if r7
        r0 = r7
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:day_range][start_index] = r0

    r0
  end

  module Year0
  end

  module Year1
    def to_h; { :year => text_value.to_i }; end
  end

  def _nt_year
    start_index = index
    if node_cache[:year].has_key?(index)
      cached = node_cache[:year][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('\G[0-9]', true, index)
      r1 = true
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      if has_terminal?('\G[0-9]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      s0 << r2
      if r2
        if has_terminal?('\G[0-9]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        s0 << r3
        if r3
          if has_terminal?('\G[0-9]', true, index)
            r4 = true
            @index += 1
          else
            r4 = nil
          end
          s0 << r4
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Year0)
      r0.extend(Year1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:year][start_index] = r0

    r0
  end

  module Month0
    def to_h; { :month => 1 }; end
  end

  module Month1
    def to_h; { :month => 2 }; end
  end

  module Month2
    def to_h; { :month => 3 }; end
  end

  module Month3
    def to_h; { :month => 4 }; end
  end

  module Month4
    def to_h; { :month => 5 }; end
  end

  module Month5
    def to_h; { :month => 6 }; end
  end

  module Month6
    def to_h; { :month => 7 }; end
  end

  module Month7
    def to_h; { :month => 8 }; end
  end

  module Month8
    def to_h; { :month => 9 }; end
  end

  module Month9
    def to_h; { :month => 10 }; end
  end

  module Month10
    def to_h; { :month => 11 }; end
  end

  module Month11
    def to_h; { :month => 12 }; end
  end

  def _nt_month
    start_index = index
    if node_cache[:month].has_key?(index)
      cached = node_cache[:month][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    if has_terminal?('Jan', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      r1.extend(Month0)
      @index += 3
    else
      terminal_parse_failure('Jan')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('Feb', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 3))
        r2.extend(Month1)
        @index += 3
      else
        terminal_parse_failure('Feb')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if has_terminal?('Mar', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
          r3.extend(Month2)
          @index += 3
        else
          terminal_parse_failure('Mar')
          r3 = nil
        end
        if r3
          r0 = r3
        else
          if has_terminal?('Apr', false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
            r4.extend(Month3)
            @index += 3
          else
            terminal_parse_failure('Apr')
            r4 = nil
          end
          if r4
            r0 = r4
          else
            if has_terminal?('May', false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 3))
              r5.extend(Month4)
              @index += 3
            else
              terminal_parse_failure('May')
              r5 = nil
            end
            if r5
              r0 = r5
            else
              if has_terminal?('Jun', false, index)
                r6 = instantiate_node(SyntaxNode,input, index...(index + 3))
                r6.extend(Month5)
                @index += 3
              else
                terminal_parse_failure('Jun')
                r6 = nil
              end
              if r6
                r0 = r6
              else
                if has_terminal?('Jul', false, index)
                  r7 = instantiate_node(SyntaxNode,input, index...(index + 3))
                  r7.extend(Month6)
                  @index += 3
                else
                  terminal_parse_failure('Jul')
                  r7 = nil
                end
                if r7
                  r0 = r7
                else
                  if has_terminal?('Aug', false, index)
                    r8 = instantiate_node(SyntaxNode,input, index...(index + 3))
                    r8.extend(Month7)
                    @index += 3
                  else
                    terminal_parse_failure('Aug')
                    r8 = nil
                  end
                  if r8
                    r0 = r8
                  else
                    if has_terminal?('Sep', false, index)
                      r9 = instantiate_node(SyntaxNode,input, index...(index + 3))
                      r9.extend(Month8)
                      @index += 3
                    else
                      terminal_parse_failure('Sep')
                      r9 = nil
                    end
                    if r9
                      r0 = r9
                    else
                      if has_terminal?('Oct', false, index)
                        r10 = instantiate_node(SyntaxNode,input, index...(index + 3))
                        r10.extend(Month9)
                        @index += 3
                      else
                        terminal_parse_failure('Oct')
                        r10 = nil
                      end
                      if r10
                        r0 = r10
                      else
                        if has_terminal?('Nov', false, index)
                          r11 = instantiate_node(SyntaxNode,input, index...(index + 3))
                          r11.extend(Month10)
                          @index += 3
                        else
                          terminal_parse_failure('Nov')
                          r11 = nil
                        end
                        if r11
                          r0 = r11
                        else
                          if has_terminal?('Dec', false, index)
                            r12 = instantiate_node(SyntaxNode,input, index...(index + 3))
                            r12.extend(Month11)
                            @index += 3
                          else
                            terminal_parse_failure('Dec')
                            r12 = nil
                          end
                          if r12
                            r0 = r12
                          else
                            @index = i0
                            r0 = nil
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    node_cache[:month][start_index] = r0

    r0
  end

  module Day0
  end

  module Day1
    def to_h; { :day => text_value.to_i }; end
  end

  module Day2
  end

  module Day3
    def to_h; { :day => text_value.to_i }; end
  end

  def _nt_day
    start_index = index
    if node_cache[:day].has_key?(index)
      cached = node_cache[:day][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if has_terminal?('\G[123]', true, index)
      r2 = true
      @index += 1
    else
      r2 = nil
    end
    s1 << r2
    if r2
      if has_terminal?('\G[0-9]', true, index)
        r3 = true
        @index += 1
      else
        r3 = nil
      end
      s1 << r3
      if r3
        i4 = index
        if has_terminal?('\G[0-9]', true, index)
          r5 = true
          @index += 1
        else
          r5 = nil
        end
        if r5
          r4 = nil
        else
          @index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Day0)
      r1.extend(Day1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i6, s6 = index, []
      if has_terminal?('\G[0-9]', true, index)
        r7 = true
        @index += 1
      else
        r7 = nil
      end
      s6 << r7
      if r7
        i8 = index
        if has_terminal?('\G[0-9]', true, index)
          r9 = true
          @index += 1
        else
          r9 = nil
        end
        if r9
          r8 = nil
        else
          @index = i8
          r8 = instantiate_node(SyntaxNode,input, index...index)
        end
        s6 << r8
      end
      if s6.last
        r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
        r6.extend(Day2)
        r6.extend(Day3)
      else
        @index = i6
        r6 = nil
      end
      if r6
        r0 = r6
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:day][start_index] = r0

    r0
  end

  module Season0
    def to_h; { :month => 12, :day => 21, :season => true }; end;
  end

  module Season1
    def to_h; { :month =>  3, :day => 21, :season => true }; end;
  end

  module Season2
    def to_h; { :month =>  6, :day => 21, :season => true }; end;
  end

  module Season3
    def to_h; { :month =>  9, :day => 21, :season => true }; end;
  end

  module Season4
    def to_h; { :month =>  9, :day => 21, :season => true }; end;
  end

  def _nt_season
    start_index = index
    if node_cache[:season].has_key?(index)
      cached = node_cache[:season][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    if has_terminal?('Winter', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 6))
      r1.extend(Season0)
      @index += 6
    else
      terminal_parse_failure('Winter')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('Spring', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 6))
        r2.extend(Season1)
        @index += 6
      else
        terminal_parse_failure('Spring')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        if has_terminal?('Summer', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 6))
          r3.extend(Season2)
          @index += 6
        else
          terminal_parse_failure('Summer')
          r3 = nil
        end
        if r3
          r0 = r3
        else
          if has_terminal?('Fall', false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 4))
            r4.extend(Season3)
            @index += 4
          else
            terminal_parse_failure('Fall')
            r4 = nil
          end
          if r4
            r0 = r4
          else
            if has_terminal?('Autumn', false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 6))
              r5.extend(Season4)
              @index += 6
            else
              terminal_parse_failure('Autumn')
              r5 = nil
            end
            if r5
              r0 = r5
            else
              @index = i0
              r0 = nil
            end
          end
        end
      end
    end

    node_cache[:season][start_index] = r0

    r0
  end

  module Hyphen0
    def to_h; {}; end
  end

  def _nt_hyphen
    start_index = index
    if node_cache[:hyphen].has_key?(index)
      cached = node_cache[:hyphen][index]
      @index = cached.interval.end if cached
      return cached
    end

    if has_terminal?('-', false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      r0.extend(Hyphen0)
      @index += 1
    else
      terminal_parse_failure('-')
      r0 = nil
    end

    node_cache[:hyphen][start_index] = r0

    r0
  end

  module Space0
    def to_h; {}; end
  end

  def _nt_space
    start_index = index
    if node_cache[:space].has_key?(index)
      cached = node_cache[:space][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[\\s]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Space0)
    end

    node_cache[:space][start_index] = r0

    r0
  end

end

class DatePublishedParser < Treetop::Runtime::CompiledParser
  include DatePublished
end
