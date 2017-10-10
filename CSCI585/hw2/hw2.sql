#Author table
create table author(authorId int, name varchar(20) not null, primary key(authorId));
#Book table
create table book (isbn varchar(255), title varchar(20), authorId int, numpages int not null, avgrating decimal(3,2), primary key(isbn),
constraint fk1 foreign key(authorId) references author(authorId));
#Users table
create table users(uid int, name varchar(20), age int, sex char(1), location varchar(20), birthday date, readCt int, toReadCt int, currentlyReadCt int, primary key(uid));
#Shelf table
create table shelf(uid int, isbn varchar(255), name varchar(20), rating decimal(3,2), dateRead date, dateAdded date, primary key(uid, isbn), constraint fk2 foreign key(uid) references users(uid), constraint fk3 foreign key(isbn) references book(isbn));
#Friends table
create table friends(uid int, fid int, primary key(uid, fid), constraint fk4 foreign key(uid) references users(uid), constraint fk5 foreign key(fid) references users(uid));

#Q1 User adds a new book to his shelf with a rating. Update the average rating of that book.
UPDATE book SET avgrating = (SELECT AVG(rating) FROM shelf WHERE isbn = '978-0812974492') WHERE isbn = '978-0812974492';
#Q2 Find the names of the common books that were read by any two users X and Y.
select book.title from book,shelf,users WHERE users.name='Y' and shelf.uid = users.uid and shelf.isbn in (select shelf.isbn from shelf,users WHERE users.name='X' and shelf.uid = users.uid) and book.isbn = shelf.isbn ;
#Q3 For each book that user X has in his to-read list, find the number of friends that have read the book.
select count(uid) from shelf where isbn in(select isbn from shelf where uid = (select uid from users where name = 'X')) and uid in (select fid from friends where uid = (select uid from users where name = 'X'))
#Q4 Find the names of all books where user X and any of his/her friends X gave the book a rating of 5 stars.(e.g.,ifXandYgave5starstobook1,andXandZgave5starstobook2,bothbooks 1 and 2 should be included in the output.)
SELECT title FROM book where isbn in (SELECT isbn FROM shelf where rating = 5.00 and (uid in (SELECT fid FROM friends where uid = (SELECT uid FROM users where name = 'X')) or uid = (SELECT uid FROM users where name = 'X')));
#Q5 Find users who have only read books that have more than 300 pages.
SELECT name From users where uid in ( SELECT uid from shelf where uid not in ( select uid FROM shelf where isbn in (SELECT isbn FROM book where numpages <= 300)) )

#--------------------------------------------------------------------------------------#
create table users (userId int, noOfRepos int, location varchar(50),email varchar(50), website varchar(50), contributions int, primary key(userId));

create table repository (repoId int, userId int not null, issueCount int, pullCount int, projectsCount int, wiki boolean primary key (repoId), constraint fk1 foreign key(userId),references users(userId));

create table issue (issueId int, creatorId int not null,raiseDate date, resolverId int, resolveDate date, primary key (issueId), constraint fk2 foreign key(creatorId) references users(userId), constraint fk3 foreign key(resolverId) references users(userId));

create table codes (repoId int, commits int not null, branches int not null, releases int, contributors int, primary key(repoId),constraint fk4 foreign key(repoId) references repository(repoId));

create table branch (branchId int, repoId int not null, userId int not null, primary key(branchId), constraint fk5 foreign key(repoId) references repository(repoId), constraint fk6 foreign key(userId) references users(userId));

create table commits (commitId int, branchId int not null, commitTime datetime, noOfFiles int, additions int, deletions int, primary key (commitId), constraint fk7 foreign key(branchId) references branch(branchId));

#Q1 1. Find the commits made by user X in all branches of a repository between 1st May and 10th May.
select commits.commitId, commits.branchId, commits.committime,commits.noOfFiles,commits.additions,commits.deletions from commits,branch where branch.userid = 1 and branch.branchid = commits.branchid and commits.committime >= '2017-05-01 00:00:00' and commits.committime <= '2017-05-10 00:00:00'
#Q2 2.Display the top ten users who made the most contributions.
select userid, count(userid) as numbers_of_contribution  from branch GROUP BY userid ORDER BY count(userid) desc LIMIT 10;
#Q3 3. Find the users who made branches of either of repositories X or Y but not of a repository Z.
select * from users where userId in (select userid from branch where repoId = X or repoId= Y ) and userId <> (select userid from branch where repoId = Z)
#Q4 4.Find the top commit with the highest lines of code reduced. (Hint: We need to find the maximized value of: number of deletions - number of additions in each commit).
select * from commits order by (deletions - additions) desc limit 1
#Q5 5.List the users who solved more issues than they raised. (i.e. number of issues in which they were the resolver is greater than the number of issues where they were the creator.)
select creator.creatorId as userId  from (select creatorId,count(creatorId) as numbers_of_raise from issue GROUP By creatorId) as creator,(select resolverId,count(resolverId) as numbers_of_solve from issue GROUP By resolverId) as solver where  solver.numbers_of_solve > creator.numbers_of_raise and solver.resolverId = creator.creatorId;
#--------------------------------------------------------------------------------------#
#LinkedIn user table
create table User(userid int not null, email varchar(50), handle varchar(50), headline varchar(50),location varchar(50),primary key(userid))
#LinkedIn organization table
create table organization(organizationid int not null, name varchar(50),primary key(organizationid))
#LinkedIn experience table
create table experience(userid int not null, experienceid int not null, title varchar(50), organizationid int not null, from_where varchar(50),to_where varchar(50), location varchar(50),description varchar(100), primary key(experienceid), foreign key(userid) references user(userid), foreign key(organizationid) references organization(organizationid))
#LinkedIn Jobs table
create table jobs(jobid int not null,dateposted date,organizationid int not null,genre varchar(50), primary key(jobid), foreign key (organizationid) references organization(organizationid))
#LinkedIn application table
create table application(userid int not null, jobid int not null, primary key(userid,jobid))
#LinkedIn network table
create table network(userid int not null, friendid int not null, dateAdded date, note varchar(100),primary key(userid,friendid),foreign key(userid) references user(userid), foreign key(friendid) references user(userid))	
#YouTube user table
create table user(userid int not null, email varchar(50), phone int, handle varchar(50),name varchar(50), favoriteGenre varchar(50), primary key(userid))
#YouTube channel table
create table channel(channelid int not null, genre varchar(50), ownerid int not null, videocount int, subscribercount int, primary key(channelid), foreign key(ownerid) references user(userid))
#YouTube subscription table
create table subscription(channelid int not null, userid int not null, primary key(channelid,userid),foreign key(channelid) references channel(channelid), foreign key(userid) references user(userid))
#YouTube video table
create table video(videoid int not null, channelid int not null, primary key(videoid), foreign key(channelid) references channel(channelid))

#Q1 1. List all channels that have more than 50 videos and have the same genres as jobs searched on LinkedIn by user X.
select yt_channel.channelid,yt_channel.genre,yt_channel.ownerid,yt_channel.videocount,yt_channel.subscribercount from 585HWDB_YouTube.channel as yt_channel, 585HWDB_LinkedIn.jobs as li_jobs where yt_channel.videocount> 50 and yt_channel.genre = li_jobs.genre and li_jobs.jobid in (select jobid from 585HWDB_LinkedIn.application where userid = 1)
#Q2 2. Delete all channels that have less than 50 subscribers but move their videos to the channel with highest number of subscribers in the same genre.

update 585HWDB_YouTube.video as video,585HWDB_YouTube.channel as channel set video.channelid = (select channelid from channel where genre = (select genre from channel where subscribercount < 50 order by subscribercount limit 1) order by subscribercount desc limit 1) where video.channelid = (select channelid from channel where channel.subscribercount < 50 order by channel.subscribercount limit 1)

delete from 585HWDB_YouTube.subscription as subscription where channelid = (select channelid from channel where channel.subscribercount < 50 order by channel.subscribercount limit 1) 

delete from 585HWDB_YouTube.channel as channel where channelid = (select channelid from channel where channel.subscribercount < 50 order by channel.subscribercount limit 1)
#Q3 3. Find all jobs on LinkedIn whose genre matches Owner-ID X's channel's genre.
select * from 585HWDB_LinkedIn.jobs where genre in (select genre from 585HWDB_YouTube.channel where ownerid = 'X')
#Q4 4.Find friends of friends of User X on LinkedIn who have subscribed to channels with the genre that matches user X’s favorite genre on YouTube. (This can be used to suggest friends.)
select * from 585HWDB_YouTube.user where userid in (select friendid from 585HWDB_LinkedIn.network where userid in (select friendid from 585HWDB_LinkedIn.network where userid = 'X')) and favoriteGenre = (select favoriteGenre from 585HWDB_YouTube.user where userid = 'X')
#Q5 Add a column "location" to YouTube’s User table based on the location associated with their LinkedIn account.
ALTER TABLE 585HWDB_YouTube.user ADD location varchar(100)
update 585HWDB_YouTube.user,585HWDB_LinkedIn.user set 585HWDB_YouTube.user.location=585HWDB_LinkedIn.user.location where 585HWDB_YouTube.user.userid=585HWDB_LinkedIn.user.userid























