Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7395287247
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 05:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776834662; cv=pass; b=bEhmJXjX+JjDdtcukpSw2G4AhS/1BGL2Nub43ArHPU4N8jqlGYFblgWA5BfsZ3ZIzjP2tonlSMgC9pgC21LTXwWQehxjf9zdLl62JmK79R0W2M22KzF2FAipt0AnqrhV1bAeM2YM/DN/KiKSooXVyJuPKAyesyn07XPdfuCc/vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776834662; c=relaxed/simple;
	bh=7DHf7sfZZ6fChRzP1Wc94qBIaKanmEivRWoijXkz4LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXj7v+jXCGTHtDfFNnhz54yrwOJWSXAo8ugbHHr6ODayHrjk228vmt9eUt2zT7gtFQ+29gd+NfqfBlKQMyajIPA4UkORDnaD2pScdjc7t+CKUoD8Hpafy12nbaZpXCvY5xOY9aJuuGUmaKSDbkKJ7Tz45thBDoXeEMkuiSYtDJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JASwDk7a; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JASwDk7a"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so5922619a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 22:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776834659; cv=none;
        d=google.com; s=arc-20240605;
        b=QDCGPOaGvySLuEmT4lwIzJmDSY8b5GUYeTB/C51D/lInG4lYwMxIGyiJsJGlQf5cne
         j4Qrws9sSWYRX7iOhv0uvXt4vASCTp+2/NMy9CKelXPCauY7G/yYDxQrNF4PNWdOP/CE
         b/YevbhUROMVzN5/GOY3kIreRbeQdfORbbHBofrJg5Hz13Qt5fzlXllIkn9YgF2vE1BR
         LyctSqiUF9RUxOaAwVL7uKX10Lq2klHYtxpF1AsB9/n97UKIP38pyFQuog51QgAepmCH
         1XIqO7eK/OoDiwzXWVKUqy/40l/o7S7O/O2PG6YFIgvLF2gmIleQIS27kmJsEQiWzEWJ
         NW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CA4CviWnDBHfvhVN0KCa0U/aLIA3VnbUXaUyaFqQ9uc=;
        fh=wPuuqO0mBls4fOaLUqeO0wqpJb5lBGVvGNQqj8LZAR8=;
        b=KWeOBgkV4RgpryqKst4iizm0eypYxggdh5FGFQK9JaItK4a3LZmbFgirQHu5ulghAJ
         YGoBgzAx2McmfESGWpJZyzmyYU9xuIwbPGcg11mTPiwDWM9n1nVDkJlw3psksojV5QGI
         Zsy/6ioU270/kKQrYjN1QnA1cg4KFZo0zQrjH2t8lUL0iEP0qqhBO9mbE5gIU+ANRNan
         HovaYZcBhvbitqn+3ZakH5D1AfGKwQa8buRzwwgOl4fTCbMpTW15kxhAJsJptCYFaPmL
         hWSP+XTAVJgDmGnm/5EG65BaxSvxBO5ecEhbqsG63jMMpH7oFffD9uauwYwotmstmCbw
         UQSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776834659; x=1777439459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CA4CviWnDBHfvhVN0KCa0U/aLIA3VnbUXaUyaFqQ9uc=;
        b=JASwDk7aKfceJ1XSN/lMUb3yVvxU4PVzoE+vhSu188Bz51RvJhcH2Ph05UNSF3fgAG
         E6jDfmug74IXj3+apkgZfQWPB9KllXEJWc/P+6P7aBZ6Oxgw6LCG7SRCAslHwStBzl6e
         X0dq3K555salvY3XdopRYJnxgsVw+F+QdIB9aWN8tgoI4rzsE3joJy53iEX9Gt/ZCrQG
         irMMLwgfYzWDwTnis1xklIoG7WIRWYVS9ToUVFSwy4pAMruZ7cYrF/9jETqOWGL6jlXw
         B9HdcvDfqxyDasKntlomQBgiE2ipU4czyLm+jJCjFZuTzIRFs68SChcHEfbJMp2ivsHe
         cN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776834659; x=1777439459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CA4CviWnDBHfvhVN0KCa0U/aLIA3VnbUXaUyaFqQ9uc=;
        b=Ivb+wZ40J+tYkZu7mUAti1H9lQLxlQbYrBQHGSepUCPcP7Hyt69FPLH0VpCCD2Qa5B
         MJiSwhgUW1eNiYRYN0thXFodthp+FlrRylM8GTuhwG1vIfeYjqPeny/erPB6cG264G5F
         W2mQZbmtmY8bn4BLeJqnywN6tmI36sb50IV5VKX5Ltw88FaskqW8odmDtv2AQ4uKfjjw
         UEuVmBmltyYFAvIAG31nFmPWOuRVhvZiZw/V6GbIVRhudoKarVCWw4OQxpD1siQGUChE
         AeJFJ7LxF2dPhCns+aRwTpXn3YCP7waaHpWVvtaZ2lL02cVgIkdtSWzJixISiMP/OdEI
         JY0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+F1ApC7St5J7tT2dWakv+GXQq+yYR6gsGqw+U/T8IsZli6pFbS27ECtqf9tzkweggzx6q+Wopm0Yd9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3zg3uYJdt0fVw3shgJmNNAY/HWAUrPvcJOWJYkTsKvkAzMxrx
	DNnAzc/nnuZvqEVABYaDlnG5Fr5Q6voAuvQr+RETMXadW/+YrVofknyMUlchzV4eSHS1T9hZdsI
	hDbqgQDkxjDzX/99xe4pWi9w2YUyWakw/Mtl56Ow=
X-Gm-Gg: AeBDietSZahNW8JxFnU8OaCg4D3h1q8unqq/9RhuupT66AEFPBHi0mJJqBBu2UTTM/B
	cWI1ekBpAhfAxnvdouWfyrT9+AZRRz5L0AtZoX6pzAk8S3re/w0XCwSHoyA3lFbmKfqv5UflCNr
	f0Tg6WLkDKyuXP8AqSutEwy6rR6QilHJ/FeVaUlRlj5M5L5dllg3FiaTowep4lsrBy72sSZPzTF
	dRCLnQJRzbwzG10WDaSl5zyRk2evI8CD9ZsXYlwX3L5pR4O0+k5Yp478pF8lDvsycZkCFRdgwpS
	wsZoroPToBEiLpC023Q+wgc/g2vC0ZaWifgT6fhqO+NBirJYUqjc
X-Received: by 2002:a17:906:208f:b0:ba9:2611:31e6 with SMTP id
 a640c23a62f3a-ba926113690mr268344966b.6.1776834658809; Tue, 21 Apr 2026
 22:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <20260420221637.2631478-14-joannelkoong@gmail.com> <CAOQ4uxi-cRwxjadAcxgs9X3SBRJWyPLik4hqkA6h=YDfSEK7pQ@mail.gmail.com>
 <CAJnrk1b=5vRgm1otKAiaeFJr9_J-aLnoVTp4MHAz2mBKtcE2dw@mail.gmail.com>
In-Reply-To: <CAJnrk1b=5vRgm1otKAiaeFJr9_J-aLnoVTp4MHAz2mBKtcE2dw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 22 Apr 2026 07:10:47 +0200
X-Gm-Features: AQROBzAUowPyiLcPvAmp5FGG3h5nljq5dWXJ2iCOWwTSYirpGP9ta9k1IvB_nLQ
Message-ID: <CAOQ4uxhkqUAD_tmH4tsLQvZKepBHVJiNRuNvfJunsFt30=jXEg@mail.gmail.com>
Subject: Re: [PATCH v1 13/17] fuse: add passthrough support for atomic file creation
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 2:40=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Tue, Apr 21, 2026 at 12:51=E2=80=AFPM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> >
> > On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gma=
il.com> wrote:
> > >
> > > Route FUSE_CREATE (atomic create + open) through fuse_entry2_out when
> > > FUSE_PASSTHROUGH_INO is enabled. If the server returns a backing id,
> > > the newly created inode will be associated with the backing file for
> > > passthrough operations before the dentry is instantiated.
> > >
> > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > ---
> > >  fs/fuse/dir.c | 44 ++++++++++++++++++++++++++++++++++++--------
> > >  1 file changed, 36 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > > index e5a7640fcd30..637761de2c5b 100644
> > > --- a/fs/fuse/dir.c
> > > +++ b/fs/fuse/dir.c
> > > @@ -976,8 +979,15 @@ static int fuse_create_open(struct mnt_idmap *id=
map, struct inode *dir,
> > >         args.in_args[1].size =3D entry->d_name.len + 1;
> > >         args.in_args[1].value =3D entry->d_name.name;
> > >         args.out_numargs =3D 2;
> > > -       args.out_args[0].size =3D sizeof(outentry);
> > > -       args.out_args[0].value =3D &outentry;
> > > +       if (use_entry2) {
> > > +               memset(&outentry2, 0, sizeof(outentry2));
> > > +               args.out_args[0].size =3D sizeof(outentry2);
> > > +               args.out_args[0].value =3D &outentry2;
> > > +       } else {
> > > +               memset(&outentry, 0, sizeof(outentry));
> > > +               args.out_args[0].size =3D sizeof(outentry);
> > > +               args.out_args[0].value =3D &outentry;
> > > +       }
> > >         /* Store outarg for fuse_finish_open() */
> > >         outopenp =3D &ff->args->open_outarg;
> > >         args.out_args[1].size =3D sizeof(*outopenp);
> > > @@ -992,6 +1002,8 @@ static int fuse_create_open(struct mnt_idmap *id=
map, struct inode *dir,
> > >         if (err)
> > >                 goto out_free_ff;
> > >
> > > +       backing_id =3D fuse_process_entry2(fm->fc, &outentry2, &outen=
try, &sx);
> > > +
> > >         err =3D -EIO;
> > >         if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.n=
odeid) ||
> > >             fuse_invalid_attr(&outentry.attr))
> > > @@ -1000,16 +1012,26 @@ static int fuse_create_open(struct mnt_idmap =
*idmap, struct inode *dir,
> > >         ff->fh =3D outopenp->fh;
> > >         ff->nodeid =3D outentry.nodeid;
> > >         ff->open_flags =3D outopenp->open_flags;
> >
> > Unless I am missing something, you need to set FOPEN_PASSTHROUGH
> > in ff->open_flags otherwise finish_open will not open the ff->passthrou=
gh
> > file (with the correct RW mode).
>
> Currently in this series, the kernel enforces that if there is a
> backing file registered for the inode, the server is still expected to
> set FOPEN_PASSTHROUGH and provide the backing id in the FUSE_OPEN /
> FUSE_CREATE reply. My original motivation was for keeping the api
> contract consistent between FUSE_PASSTHROUGH_INO and the regular
> passthrough mode, but I think you're right that this is just overkill.
> I'll remove this restriction in v2.

Actually, that's not what I meant.
I had a silly braino reading the subject
"add passthrough support for atomic file creation" and thinking that we wan=
t
to passthrough the CREATE op :)
so you may ignore this comment in the scope of this patch.

As for the api, I am not sure if it's an overkill.
I kind of like it the way it is - IMO keeping the dialect over explicit
is better than being ambiguous, but am open to other opinions.

Thanks,
Amir.
