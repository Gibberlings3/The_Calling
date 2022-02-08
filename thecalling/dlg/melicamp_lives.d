REPLACE_TRANS_TRIGGER thalan BEGIN 27 END BEGIN 0 END ~RandomNum(2,1)~ ~~
ADD_TRANS_TRIGGER thalan 27 ~False()~ DO 1

// ees move the final journal entries and wrapup to end of thalantyr dialogue chain, *after* we branch it, so need to add it to calling branch
ALTER_TRANS melica BEGIN 24 END BEGIN 1 END BEGIN 
  ~SOLVED_JOURNAL~ ~#%cd_journal3%~  
  ~ACTION~ ~AddexperienceParty(2000)
            ReputationInc(1)
            EraseJournalEntry(%cd_journal1%)
            EraseJournalEntry(%cd_journal2%)~ 
END
