Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5AD3C454B
	for <fuse-devel@lists.linux.dev>; Mon, 13 Apr 2026 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776083014; cv=pass; b=hcGUphA9j3pW3nJ06+gHthwocfez5pPV8ZaN8J3KRB6FcwMsykDK42ORpo0zx9pTDgWjcSKYHh5ayIXz8XAph1rShnWa32nOdnovTY3qHA5uwVUT7MnkHZpnCiu43i4wHdwmQh0YAQQPUsnFPd7qAs5OA70dtpfh/2KpPucdkv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776083014; c=relaxed/simple;
	bh=NJnbcxur+Di9Sw8iiKloTt0UVQQYsI9XXlYh0xw/qC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llJR7IIcx0dB6W1bTo31YdmuHmVZtzbgf9vuUWNtNMCSzPvcs4sFxyBCzo+IfQLz9kIdqGEo/pyDb4rwu2+0p98gBlYcxGKcFtmt8TxtZ/AsDyqqOu6cNhHpUDSD9ZE1jAQpFRQ94oFOaqjePyqjw3gMwTo0W228seCrtw6MwPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5uzd6sR; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5uzd6sR"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-671a2f2837bso859681a12.1
        for <fuse-devel@lists.linux.dev>; Mon, 13 Apr 2026 05:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776083011; cv=none;
        d=google.com; s=arc-20240605;
        b=MdMLl3KUgbl86enryZW7+jKsyQDamygJCkXqBGeCuEAx6MWfv948cbSkcS0+Omnpoi
         I3GrNSSeUZ7quxEahphCUpq/RhyX2c0gfHbj+P3oKjt6RkQyXtf43Dcm8aiQCL+UXn/1
         3DsK25wiXQXYG+M3b//6NrUb2b+o88SJDkWspNW9AcEZtjOGer2lxpUhkHurFGMwTm95
         A+dAD+IwvnWhGsJG9h6HQ4tVdKwi7vfkACbvQBJgJ8/2vp+9sfvaMUdBb2UgLZDy3EBc
         3lhDLnHIUYNb0crInABMtjJQnqpCjQHiWl/pnDETo1JS3Rl/LTLW1/FaoZcIEmvvdVz5
         9MQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WdXBDy3UTCAqlwG2cuSmoWMTuv5Bur9pQvnnMUgtqi4=;
        fh=6SvoUeY6mEOdeA1BEWBbrbwRVgEzRvyjGVekmswmQco=;
        b=ZYaCt1dHNLnxa436MppDCv3oKxvXWejkkSQjzfYvJxpj2ovftSNEH3+jXGiWygnI6i
         j+xKnSnfuF+Q8LT2vhEaVQG+DZQqTPmE3y/kjZppYbECcnHLb15bCRh/w27u/bf98ffq
         SNs3P3BJjTopvKi/EcFqALjDOK663viQPJfRn576cSPVOvCOBYeSkMIEMyCX6mf/WXH8
         kl6Xwxh7L3QoLTPPf9tm0POFJWrl9g3jfk2Q9n8b0OosGgn8YCxX0jHZb83E9i5jJ7i+
         6nu4vNhal8e5qedxZCWED9womdB4MEyhTMNTqb08LRAxed3s64vMpwMuc/7DztHfz2AH
         SSbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776083011; x=1776687811; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdXBDy3UTCAqlwG2cuSmoWMTuv5Bur9pQvnnMUgtqi4=;
        b=n5uzd6sRxmoaZ3wZUDZMwYImSjqtnPocDuDWySa08c0AhNa8SUX/HxlNkkoHkzx++u
         Kw7VmWcJWt90vmdID2M4PGEpxoVlM/Ce+bAi7kenzQHL2ECkX93uS5oxIi2Havm8xp/o
         9rZgwfKh5dJCPZU8hEuhYHwVtcE40LJdd2/rcA/12LTV1x3KAzornIGFjlokkkqKO3za
         v7nJenNTcZgJcZuDkfitz0JzZgw9UHpw+Fy/UU37zK1GdJMOf3LcBl6EVXm3OZy9xtIL
         p9Vc/kRRPI+dtwzZ2rnDmhBMMooto5A8Qp3uBEv0NFFK1I19ao0QFqsMf1tpvbHLN3dd
         c7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776083011; x=1776687811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WdXBDy3UTCAqlwG2cuSmoWMTuv5Bur9pQvnnMUgtqi4=;
        b=jUKW7wxp0XLopyHYi4hSWhj1ZvNizebwkNvGc3wOIgLuELZpdjTY2d2w9BLEUwRX0x
         try7849RcJKDVhn19xK8HKBre3SHfbN+H0lbyGokeq6iUbk5kvWChhPN0YOc+tswKnBS
         kaf3B1ggFVG1bDRmoCPW4GphdQ8KnU1ca0IH6GyIo4E79fGm7ADcqz5jSYe0NCcTELfB
         beJl557mYctitdcHqnJxuA6sMqYcm5U9l5hZ5SLcGUxnKpEtO233v5M3qH5Egi859QTq
         aigJqnGrVp01e95JwzhaLkJAdvcNBz/M0YJs8YvL5ezKDobRhg8n3gE4uvCS+GUaKe9+
         vDAw==
X-Forwarded-Encrypted: i=1; AFNElJ+3U9gHOLKBoUleHkUsSd7+9jaouL6B3wTnMQz51nYHW0qIp+1MkOjsefFkomkTBh+ORgbdx5PdQbwa@lists.linux.dev
X-Gm-Message-State: AOJu0YwcmoTw9zXZxGkVUHolIFswzda3pJa1w37Ko+nTY+DxRSlU3hMF
	lZFLozItNNYxI7Qk6lK1CazRAYjfZ7nBabyL/++z49v8oUtV63ooUlrMUhFnLpUBIP/B33VHqgS
	s6d7zI6ESQWDbSZimlEIV8AS8B63MCnA=
X-Gm-Gg: AeBDiesPzmv/on5KhUe8Acprp+s6VuHZtljSRS5WW9YkIq7+oTWyayIaGMvb0L1eP2O
	4aBLO7xPbqpzkjPdwsNGv/4H8qWgVxj62FCst5uXDC7tGxKhXPV1R5X/Q4/5R8hoix+O7Rq7sQF
	xgQ6/SWZSIgCI7/qYL0gkB18FWIAPV7/joOHcIa5t8TD1nITmYT2+YVMq3fl6x86l+H+Lix6EP1
	pqlpK/T3qbh4d5/iT2Aftm2zc3TxRlY6v0u0Deef+jg65HMWmZjsWgAZNc4swCFfoMRLkzXe6OL
	xnPaNg3WaGkSP1qMMeBUR6zreFcX4f2thetXX2CYBQ==
X-Received: by 2002:a17:907:c48e:b0:b9c:5672:852 with SMTP id
 a640c23a62f3a-b9d727fe83bmr746453066b.40.1776083009787; Mon, 13 Apr 2026
 05:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260326-fuse-init-before-mount-v2-0-b1ca8fcbf60f@bsbernd.com>
 <adTyw4UJ04qOggCQ@amir-ThinkPad-T480> <c4ffec34-fad0-40d9-bff1-06c3cd202351@bsbernd.com>
 <CAOQ4uxhBC7eTkaB6Ws1DqewzxkGdEfcCyJ8EZszn+YeHwG0-wQ@mail.gmail.com>
 <5d7295b0-bd7e-41e7-b176-3d19b240413c@bsbernd.com> <20260407191046.GL6254@frogsfrogsfrogs>
 <CAOQ4uxiU3RcoNMD21Yx_ZPqCpmtL8-Eda=a5+uJC+AsO7F=_2Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxiU3RcoNMD21Yx_ZPqCpmtL8-Eda=a5+uJC+AsO7F=_2Q@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 13 Apr 2026 14:23:16 +0200
X-Gm-Features: AQROBzBJEPDbN5cE7NaFSed_jf6F4jyPs0uC1n1qzEhkM_oy3DQDatuGivkhF2E
Message-ID: <CAOQ4uxg+DhWoKtHFOt4eEgYYqAAmcJG_q3nJcQ2ZVOFCWRN0bw@mail.gmail.com>
Subject: Re: fuse-devel list on kernel.org
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Bernd Schubert <bernd@bsbernd.com>, linux-fsdevel@vger.kernel.org, 
	Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, Kevin Chen <kchen@ddn.com>, 
	Bernd Schubert <bschubert@ddn.com>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 10:21=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Apr 7, 2026 at 9:10=E2=80=AFPM Darrick J. Wong <djwong@kernel.org=
> wrote:
> >
> > On Tue, Apr 07, 2026 at 08:05:36PM +0200, Bernd Schubert wrote:
> > >
> > >
> > > On 4/7/26 14:29, Amir Goldstein wrote:
> > > > On Tue, Apr 7, 2026 at 2:25=E2=80=AFPM Bernd Schubert <bernd@bsbern=
d.com> wrote:
> > > >>
> > > >>
> > > >>
> > > >> On 4/7/26 14:04, Amir Goldstein wrote:
> > > >>> On Thu, Mar 26, 2026 at 10:34:33PM +0100, Bernd Schubert wrote:
> > > >>>> I'm taking Darricks example here and posting API changing libfus=
e
> > > >>>> changes to linux-fsdevel. We should consider to create a fuse
> > > >>>> specific list if that is too much. The existing
> > > >>>> fuse-devel@lists.sourceforge.net is rather hopeless due to lack
> > > >>>> of spam filtering.
> > > >>>>
> > > >>>
> > > >>> Let's do this already!
> > > >>>
> > > >>> https://korg.docs.kernel.org/lore-archives.html
> > > >>>
> > > >>> Do you want me to send the email to kernel.org?
> > > >>>
> > > >>> I suggest that we ask for fuse-deve@lists.linux.dev
> > > >
> > > > Just don't copy paste my fuse-deve typo in the request ;)
> > > >
> > > >>> and then we can migrated the old sourceforge archives
> > > >>
> > > >> I'm all for a new fuse mailing list.
> > > >>
> > > >>>
> > > >>> As far as I can understand getting the archives from sourceforge
> > > >>> required the admin password:
> > > >>>
> > > >>> https://sourceforge.net/p/forge/documentation/Mailing%20List%20Ar=
chives/
> > > >>>
> > > >>> Mikos,
> > > >>>
> > > >>> Will you be able to handle the archive migration?
> > > >>
> > > >> Have that password from Nikolaus.
> > > >>
> > > >
> > > > Excellent, so will you be sending that email to helpdesk@kernel.org=
?
> > >
> > > I can login here as admin:
> > > https://lists.sourceforge.net/lists/admin/fuse-devel with the admin
> > > password.
> > >
> > > Here https://lists.sourceforge.net/mbox/fuse-devel which is supposed =
to
> > > create the mbox file it asks for "user" and password. Assuming the
> > > password is the same, what is the "user"? Also tried my user sourcefo=
rge
> > > credentials, does not work either.
> > >
> > > Can we defer this a bit? Too many things to do and I think for now
> > > reviewing Joannes Patches and finishing sync-init and Darricks mail h=
as
> > > a higher priority than fighting with sourceforge mbox.
> >
> > I don't have a problem with deferring, but FYI you don't have to have
> > old ML history ready to go when you apply for a new list.  It, erm, too=
k
> > us months to scrounge the entire xfs history together after linux-xfs
> > was created.
>
> I requested the list:
> https://lore.kernel.org/linux-fsdevel/CAOQ4uxjRgQGxWYWbRbjVZy19oA5qKZSd9e=
ANKyD8yCoBNGPNNw@mail.gmail.com/
>
> I cannot imagine anyone missing the fuse patches on fsdevel
> if people just started posting their kernel and libfuse patches to fuse-d=
evel.
>
> Should have done this two years ago when it was also proposed.
>

Well the list is up (now in CC) <fuse-devel@lists.linux.dev> and
archived on lore.kernel.org.

Now you'all only need to subscribe and send the patches there.

Cheers,
Amir.
