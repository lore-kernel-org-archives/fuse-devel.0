Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1B36F8FE
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572433; cv=pass; b=DoBUScuZLySTpcq382IVnSaqrgrz60EgLWMRf8TG1VWj+MktTcZVoFiLKwkNvmxvWHAahf1F524nupuNKg/28VQ8CDUB22I6DoJnEM0CXdaPVma69+2XRk8sZcI7aS+687QWx7YV+oM4E333IczLNbjxkfskDEmhJu0lj2sXQPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572433; c=relaxed/simple;
	bh=vK1Y2mmloT+7GbNXvVvlIPeAF7TiqUt8RhvKd2TCTBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGF8+cyuBFYRTMKc8nb1LFm2gn4rtZLRbXKbu2ypXGlFrCPbTVcYNT7lg8TrFoCP9W+FjZrkpWxXd7U63f4qZI+PzAAj3BbpCxRAoYR/Ppk/ZOLbSJZbe98DnvW1/a7GzbbELepozaztFUmG9jEMOEKhr2ZHZ/h39ht0lKXN2mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfq3SlKm; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfq3SlKm"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67bce1840f1so8206849a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 00:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778572431; cv=none;
        d=google.com; s=arc-20240605;
        b=d+ztoKzFMRes3lK7MAaPfhmg+b9CpuLbh1aogegJWOchHQjHEeO8RdAvEOK2p9ij68
         2UBgC9+BQ5BOGePaYtjz6IrqM8TLNnylvXgos1nu9vqRBQ5ug/WISL4V9rNqlOz0gtE4
         IIBs1keOU0CLDxM6Iyfg7Cb95+wWMCtU5ejEO1iaOoYbdFmpeePNyPtJMthsx7wjZyag
         9YkgyKzmaRrVuvvnFjoUwlprYfDu75FbYmOzgWiam4ealSC2as98UweIyFLFF5INrL9b
         IWrP9EyKZpsSq5+dxSRczafb9yuVtLDSSIL5smr/WrbBPOj4Cw7N8NSDRtvpSxY1zwcC
         TsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pyyBW2eh1Dp24Y3zk3M8zpYB3+C2r+Au1F9maFjIet0=;
        fh=WEtd4TNyZghMe9yiU7hIIinMO2me9p2OeuU9Yq7S8q0=;
        b=lXeaB+oEWtsPIpCefdkyvtZx+sBEZkHaV30MOxOrS8AUKDSJl5wnXaSodYRrgfwYIm
         xyF6AN3uFOPbOeYucZ5/wXykSX34K3YeCRp4VBDXY0JnCq7yCa57SWI/4Z4YItMpsEBy
         1BG9Ed2bi3i8B+2P0TuZNUXhrnvnD0qNIiLP8qTAXbZwSRI+aDj02z2KZFkyxUzh9imj
         w47yrt88KrpuBk5NZyRfGQl3365btdebAYcUKzQr4AX/8ZxkhThzjPjRRSgkAoHNYJdM
         D6mIEbPd5r/FcWIbKQtgFN9WJ3T1b6wmMz7tXbfH5usqCXmGpSi5xqGf/MC7qC9wSErH
         sGhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778572431; x=1779177231; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyyBW2eh1Dp24Y3zk3M8zpYB3+C2r+Au1F9maFjIet0=;
        b=pfq3SlKmDUIiRBvGeBQO16/Vn9yS3TZaQv0/V2psVFOE5wAv/0/Z8LbGidDcIUlQqG
         VQXJPTqBFFcvEY4269KlQEQR1s2ztAeniyssoF0rC1X9rJaPBO+ASSo6a853TpiiJMzU
         WC97DL8sd3KEBpNVQyTM9VKfyfk/M7xm5KVN6om3RM9JQMzYzkmkXFsOo9UDnIZnAgQN
         cuMfIhe8R14EgAGzYk1NXBQD6WCsDfl9ChxuvtwvOSIcrYte+A9NbDM3Pyi21JD4PvJz
         80zgv9mWbo6+ZAQSrcc21sztUJjdC1laI7PVfJeSaQ1eKMxyVq+MfdH/2A5dNWq3nXWt
         mM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572431; x=1779177231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pyyBW2eh1Dp24Y3zk3M8zpYB3+C2r+Au1F9maFjIet0=;
        b=Jr5uCSEKmRipAr7MH32yLGTUdXmuDWTIFHvFpg8Ok6m94f8jJtsxzbFusIMa7BfuVN
         q2f8bjyKR5LYx7HRX38So8QCCfLddA/9XKEO0wTtiJxNdiACS8gtpnE5OM+g+qEoheuv
         AvGgkemEvF/+sZiq1z7SJsSHAJmKRhlMo6yJ3p1ZqSnotMpyCLLSt7apEiQcA6yYg8Dh
         xUyl7bqBGm8ByCgncTtqQxJiktmexUIH8oHtLvbjj4cEBmkOGCavDjHWWSkaLet+dsAY
         Y/86gNEywjefSz6CfVDpbVFuTSzpz6Wa6PWperIRuxRN9qwI+CwMJtDQYN/PX8gVZk47
         7/dQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+ChzVI0olQFvjVoHPX08YisOzUU+LyDX/2ebwfA7nxmg+ciE4TQrg+2RLy74hgqENOpbT7jhg8deQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+Fs5dtGDR3W+sPJM+JAh+ctqK59WZ040tjstXQyWOvFjBcN5h
	y80LAd6xdP1CEPFCxn9uHcL2PlG1w6USJOIkiw1wbfHJ9cewFB1RAzcU+6C9M724wtSnI4VFfok
	jZ2QTAzumvgOOHKz+7MeA2tyHfTo1bd0=
X-Gm-Gg: Acq92OFDRQ30dHL+bbSHY4whvTQ84a9rFZcGHrB4jNymO4uj+nqFpDHlvYaXpUMTR5i
	K3WUAeRosB+kDRkqAtuyDfhT9i8L+mx28Zrug7SqKHCVYdR7BThHdB41EBGEnSLepPBTTqQtgDD
	Jzp08/lfrJSNBeVVJF4KBlp7TPR1IDazJn+zJhXhEt5e8Mz5eJADb9gnODF+CM0OgvrRr5et6JN
	wP0mEW5rz2JDjka5kjjWVlyjF++HgGqhRAcjAsRvrzfKAuHBJih8N7GJ2t/ZzfIPjvcoabbexV3
	RAJblimz+34rDOPCOJK1gMp4rzzG167/Ptw+KaHX
X-Received: by 2002:a05:6402:424d:20b0:67b:4aab:1f10 with SMTP id
 4fb4d7f45d1cf-680cdb3839dmr776747a12.5.1778572430530; Tue, 12 May 2026
 00:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
 <CAOQ4uxhnOEkX4qnn0wHMCqWhEeAGTR9rxcw5u_oqGUovuszo0w@mail.gmail.com> <943cb464-78f3-44a7-92a7-57a1fe4fbc10@linux.alibaba.com>
In-Reply-To: <943cb464-78f3-44a7-92a7-57a1fe4fbc10@linux.alibaba.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 12 May 2026 09:53:38 +0200
X-Gm-Features: AVHnY4ICpc-P6RT18BoihboGTu-64h_D56tWJzNqKe3nxbInTpNJmuAO6xZ0SN0
Message-ID: <CAOQ4uxh4yKEBdgbkfZTVyYM1P8ahALFVJzQCj7ASkrH746_4xw@mail.gmail.com>
Subject: Re: [post LSFMM summary] where is fuse going?
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel <fuse-devel@lists.linux.dev>, 
	linux-fsdevel@vger.kernel.org, John Groves <John@groves.net>, 
	Joanne Koong <joannelkoong@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Bernd Schubert <bernd@bsbernd.com>, Horst Birthelmer <horst@birthelmer.de>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 5:20=E2=80=AFAM Gao Xiang <hsiangkao@linux.alibaba.=
com> wrote:
>
>
>
> On 2026/5/12 01:18, Amir Goldstein wrote:
> > On Mon, May 11, 2026 at 5:12=E2=80=AFPM Miklos Szeredi <miklos@szeredi.=
hu> wrote:
> >>
> >> Please let know what I missed.
> >>
> >> CO-MAINTAINER:  Position still open, though we formalized some
> >> subsystem maintainership roles, sent MAINTAINERS patch.
> >>
> >> FAMFS: Let's try to find some common ground between the fuse-iomap api
> >> and the famfs api.  I.e. add striping as a generic mapping method,
> >> even though normal filesystems don't (currently) use it.  Using BPF is
> >> a bad idea.
> >
> > IMO, FAMFS sits somewhere between PASSTHROUGH and IOMAP.
> > The simple nature of the maps, the fact that famfs maps are const and
> > queried at file open time makes me think that famfs is much closer to
> > PASSTHROUGH than it is to IOMAP (in its full capacity).
> >
> > I think Joanne has mentioned that her customers have a use case for
> > multi backing ids per passthrough file and I assume this would be a pre=
tty
> > simple map, so that sounds pretty darn close to famfs already.
>
> I vaguely remembered that Joanne mentioned that mapping multiple
> backing files into one FUSE inode at the end of session.
>
> Is that the case you mentioned here? The requirement _might_ be
> reasonable, but how does the entire page cache work for such cases?
> Each vma can only point to exact one single real vm_file and rmap
> totally relies on it.

The problem is only with  fuse_passthrough_mmap().
Depending on the workload (?) mmap may not be important and
we could fail if trying to map cross-backing-id regions.

For the rest of the I/O passthrough method we could usually do
a short read/write (?).

The main question to ask IMO is "is this useful" and the use case
and workload and customer will determine the answer to this question.

>
> Unless there are some more non-trivial core-MM enhancement (e.g. to
> split into several vmas for each range), I don't think it's possible
> for the current page cache infra. For DAX, it might be possible
> since DAX has a seperate workflow.
>

But we can also say that mapping multiple backing id should be
implemented with IOMAP, but this is also closer to famfs, because
this use case is the const static mapping determined at open time.
In a way, this is exactly the minimal subset of FUSE-IOMAP that
could be implemented and share most of the code needed by famfs.

Joanne, is there an actual workload like this or was your comment
a "maybe in the future" sort of comment?

Thanks,
Amir.
