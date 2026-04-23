Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123F19ABC6
	for <fuse-devel@lists.linux.dev>; Thu, 23 Apr 2026 01:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776906194; cv=pass; b=rJgSlsRr02l3IbDQxSlmJxUwIolN1/A0XzDG8uz9JY7EAkf14psAL0OTUn9IaR9sFaRcvGO6FMTG3TqmK0QxL4DusQapgdSceNO6sA+AaQNPoJ2KVt6Ohad+DYA9TTU5eHRAdMDx6BkA4UeyfjVXTU0xgdmrMscVXKV0fX8ctfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776906194; c=relaxed/simple;
	bh=LOumpT1NKznsi9Rh5J39M/aR7cvaSP2FtlJc04jYYO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bA8t26VmlmBzbCm+2pCdBgi2U9Yq3qV6FwRNMGSfz47nriMjpda7J42LK+8jv4rtL/9ZyJhOA474HTdhFlnikRbpC/zlCJeDMdMFIDqJDAn5cXx1a7eaGbYK5oPuGgiqFX6zKB27Wq8Url6WJ6SCTxmaJxSoZuFJa331Pf4a1y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1sx4RJs; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1sx4RJs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d70c30767so4124069f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 18:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776906191; cv=none;
        d=google.com; s=arc-20240605;
        b=IS46Zmqmp8DN0IaK77wlUG2RSdsp6CU51k+XuV4EeZmsXAyUR52h5wZSD2+f7sqljd
         5oRXw9HDVnpAU16YJEMcpZtSsNg6wh5Of7ktczfHV5YfggSLRPyXLTPRqYMERoebAQPt
         WVhBBpzPdF+nrv4NFWjldyFiGUvubP01OwWNcX4+/oj/4dFkNCoJhJ/0+O9sRHUEkARU
         0+JfmNZAiC26HuSaXR0mMncGl6vaQtyacZ8ce7iAMwDbycO2k4Rk7NnO61mpqX43DgTY
         jcvw8amLqNtxGsKaY7Q1xhkuYjWrdBvFkVHPwq2sdQ1INKnegCFX+68l6k2+YSZs/UmO
         6tOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LOumpT1NKznsi9Rh5J39M/aR7cvaSP2FtlJc04jYYO4=;
        fh=LEeRtI3yEteJyeIstAYt/hwNIEkECM5caXX449sThKw=;
        b=DxhgESErwxf7XKh5xYfJmTTLSywymihYCEKltUWO/04+6P95G2Uqax1PIAoZm0IAsF
         jIRuOuA7MxEwrK2C1lw7hlIZ1u4a5GybGVMRCwoaZljvRjltpRtpXDawLZAS6rZP76YP
         fMBSgidr8ujGOdbhF6arwwJ2n0AgiE/i+BkWhg/WjyvcgCshSqpSj0RBthO8VWDRXYuo
         9mXM9iLE78szEjF2vD+ClXALJFMSgbVJ5Z9DL6BF+tXJlo3GnVhQB5mPvAYN5BmC4B1O
         4yJi+Ha0+Tb/ph4RVqU/PEdBSJWoS8ndvcIE6kEQu7mW7WBQcLd3QJL66GTPTl1wfnNv
         p5bw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776906191; x=1777510991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOumpT1NKznsi9Rh5J39M/aR7cvaSP2FtlJc04jYYO4=;
        b=o1sx4RJsykLvRPWHIQMoPrZ0ypXiK/a+4mlMvAHxE9ES09YRyygtdXi8hhfVvc4PAf
         yuiXt1hXQ4DIGtt3jsrfAmnOwk8ylC3Yp1p2gIKRm8yXJMrXgY0BrHtIjimS4CWu2WCY
         0nzRVeik6kCzKrTFDgUNXkTiN6iiwJlqA4XRF0dqRnIa1+Gaudkx0JgpSequ5ZVhdDiy
         FLFxsw9KpjmIt6qRvrig0g/C0kPpshxx3+84N8FIHk/i0S9tFAKvHxNN1jM/dVXL+VkT
         O7AwY8UimQp83nNq+kZlY9ZiB/HKLiKDwEieItMyy1PzQ7ah37SZJtvkPH3CS6ONloxY
         MabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776906191; x=1777510991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LOumpT1NKznsi9Rh5J39M/aR7cvaSP2FtlJc04jYYO4=;
        b=j1miZ/rhzvJmBJ5nQz80DAiY0ebjjPAEYqTjw/96aIDmSilQvS2GcuylDJA4vXlzZK
         pmdyTx/cpq/D/0lYAO8aKIGwy9vAhIXbFcXIuHNVY5XEbn3LhLA7Nog9hDhHrt4Ph0W0
         DqLSZfVzQl25F9eGH4sqRppZMfOtCn4pe57STdxGGgOm28XozLRQydRJPjzH4f/P5Kop
         A+dOXvJcIuYzdBhHIyVqtkfINkUuUO/dy5/ZIA0OTiDBG5lyhvHzWEMeUWL92U33wnQz
         ZPfhSlnIO0lXg5Gns68mu449zOlkyNT1pcurm1EGgJSx/7MIkFOVOVCbYbciWraKQ5Wh
         AheA==
X-Forwarded-Encrypted: i=1; AFNElJ+5c5iDQ+3hC6OeSSvf4CY5dpfXU6gr4qgHLSnyn9+divkGBzCsmlS7n52j5MWUgRXhaUhxa886rRqN@lists.linux.dev
X-Gm-Message-State: AOJu0YxwOxKHUE+njqYqsYghA/9Aw8AYRRNSWwAxxbBl6lvjMdQAMT7e
	quf14XV7UmgIUyjKSbH/bf8EeYYz4uw1hmTB50VtgoWl8bRSPmsEAR+a84kuHtBJsnoJiGOkeEc
	vRmjuXCrsQWE9iqf4cTOiUKyiYPGvi4Y=
X-Gm-Gg: AeBDievWmmGaszqkaorp6jTqWzCEy8C+00rh6LS0N/C3TWy1ezioUxZYtMTjdZkqYkH
	JFJ2zNJSmeHzJDWaQdZgt8gXCDfWU/bcCsl54lzhK+olniBzAxJJFRUNlSvSQyR/mUpIvQBjWxh
	YjaPsFT0GFXZUbEl7sgRJUyJSCweu1YqtYeEC0scxDT5choo7WPNMSGY7Fe5ThviEZqXNTwIkwQ
	vb6chF1hS/f7VLw/zIT/+7rLLLck9HGMc1bAzx5VKx/ngcbnec57hXPerkSOOZQ7MkSNjZ8pnhS
	mCd+fPfpygKtBKol
X-Received: by 2002:a5d:5d83:0:b0:43c:fc5c:aa08 with SMTP id
 ffacd0b85a97d-43fe4034413mr38321613f8f.8.1776906191288; Wed, 22 Apr 2026
 18:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <CAOQ4uxhbR8AoBCUMYQntAHzo_1wjh=Qcpb1z0CE4ynfDE-ZAFQ@mail.gmail.com>
 <CAOQ4uxhVnzoka4QppUvmFmq3wtXSU_ahgpkNR==Gbnpm5hpUyw@mail.gmail.com>
 <CAJnrk1YJ9YDTrERtNiXZ=vAHr7kKRzS7iUphQemVVXf63yt7qQ@mail.gmail.com> <CAOQ4uxjBZL6CY0mJEiHrw8aR28MHg5pU+Pfr9fUqGdKPDOdwcw@mail.gmail.com>
In-Reply-To: <CAOQ4uxjBZL6CY0mJEiHrw8aR28MHg5pU+Pfr9fUqGdKPDOdwcw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 22 Apr 2026 18:02:59 -0700
X-Gm-Features: AQROBzAEawgDHKruNDJgjhFioab986TIhqRVKjhze4GFA7ZPlvJ-XNrAGB7TlUs
Message-ID: <CAJnrk1b6dc7j8WPDawkR5LZ=8i92h-adniw8XK3Lrb9+7vjqGA@mail.gmail.com>
Subject: Re: [PATCH v1 00/17] fuse: extend passthrough to inode operations
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 11:02=E2=80=AFPM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Tue, Apr 21, 2026 at 11:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > The main intended use case at Meta is to use passthrough to reduce
> > startup latency for short=E2=80=91lived services and batch jobs that ne=
ed to
> > fetch large packaged artifacts over the network. The idea is to add a
> > fuse-based lazy materialization layer that supports on-demand fetching
> > for cold data but that once the required content has been fetched
> > locally, can switch to passthrough for near-native performance with
> > minimal userspace overhead.
> >
>
> Yes, I figured.
> I wonder if Meta plans to completely phase out the fanotify
> pre-content events based solution.
> I myself am putting money on both horses so not advocating
> for one or the other, just curious.
>

Yes the plan/hope is to have this fuse server be the replacement for
the current fanotify implementation.

> > >
> > > Is the target fuse filesystem expected to be used by arbitrary users/=
apps
> > > or by a controlled set of users/apps where a posix_fadvise() may make
> > > sense to configure readdir vs. readdirplus?
> >
> > I think it'll mostly be used by different containerized/batch
> > workloads and services, so for Meta's use case, I don't think it can
> > assume users/apps can be modified to use posix_fadvise().
> >
> > >
> > > What is the minimal set of passthrough ops that would make this usefu=
l
> > > to your internal customers? Is readdirplus in this set?
> >
> > The minimal set of useful passthrough ops would be open + read
> > passthrough, getattr/statx passthrough, and readdirplus. The internal
>
> Do you not see any getxattr in this readonly workload?
> Are posix acl checks not in play?
> passthrough of getxattr/listxattr is quite low hanging IIRC.
> I actually had it in the wip branch at some point.
> Unfortunately, I don't remember what was the reason I removed it.

The team I talked with did not mention anything about extended
attributes but I'll double check with them. Thanks for the suggestion.

>
> FWIW, for my internal customers passthrough of
> readdir,getattr,getxattr and access() is used to speed up
> file browsing workloads (especially for huge directories).
>
> readdirplus is of course desired for this workload.
>
> Passthrough of open, I am not sure why this is so important?
> As fast as passthrough read/write is I expect it would amortize the
> cost of OPEN calls to the server, unless the workload is open
> of many small files??

This wasn't requested by our users but it was something I added
because I thought it'd be useful and it had seemed straightforward. I
don't think I have the requisite vfs knowledge for this yet though, so
I'm going to drop it from this series and bring it back once I study
up on the vfs side of things, if it does prove to be useful.

>
> > use case is read-only. readdirplus would be useful because the
> > workloads often do directory walking followed by metadata lookups for
> > the entries
> >
> > >
> > > Do you have profiling numbers to indicate which ops generate the most
> > > overhead for would-be passthrough ops routed to the server for the
> > > target workloads?
> > > And how do these numbers improve when using io_uring channel?
> >
> > I do not, but if you recommend getting them, I can run some benchmarks.
> >
>
> Up to you.
> My intuition says that passthrough ops are a big win anyway,
> but I never checked to what extent uring ops are to closing this gap.
>
> > >
> > > Regarding "full subtree passthrough", what does that mean?
> > > That lookup op itself is passthrough?
> >
> > Yes I was thinking this would be something where once a directory is
> > marked as full passthrough, the fuse server never sees any requests
> > for paths within that subtree and everything is fully passed through
> > to the backing directory.
> >
>
> Do your internal customers have this use case?
> A subtree which is known to be fully materialized?
> I wouldn't advise trying to implement such a complex feature
> without at least one real customer to justify a real world use case
> where this feature would actually be helpful.
>
> Is the cost of reducing a single server call per cold cache directory
> really worth the extra complexity?
>

There is no concrete internal use case for this. I was more just
thinking this would be useful to have for situations where a
subdirectory has already been entirely downloaded over the network and
can be passed through from the start, but I agree it's not worth the
complexity. I will drop this.

> I could understand "passthrough all immediate non-dir children"
> may be useful and not add so much complexity but again
> better base this on some real world use case.
>
> > >
> > > In that case, would there be no way to escape (opt-out of) passthroug=
h
> > > inside the subtree?
> >
> > Yes I was thinking this would only be used when all files in a
> > directory map 1:1 to a backing filesystem.
> >
>
> I remember at the time that Android FUSE passthrough/BPF patches
> were discussed, that the 1:1 config was mentioned as a good way
> to test passthrough ops, but this could be a simple per fc config
> which does not raise all the hard questions about subtrees and
> renames.
>
> > >
> > > The semantics sound challenging especially when considering
> > > moves of directories in and out of subtrees.
> >
> > I was thinking cross-boundary moves would just return -EXDEV, but
> > there are probably other semantics I am glossing over here.
> >
>
> What is the "boundary"? Who checks this? kernel or server?
> Those are questions best avoided unless we have a good enough
> justifications to answer them.
>
> > >
> > > Anyway, no wrong answers here, just trying to understand the
> > > first mile store you are aiming at and the expected improvement.
> >
> > The first goal I have in mind is eliminating the getattr and open
> > round trips. I was envisioning the passthrough work to be a
> > multi-series effort where
> > everything would get merged together at once only when all the pieces
> > were ready.
>
> Everything being the read-only ops? or everything everything?
> The main reason I introduced the ops mask was so that we
> can chew this huge effort in small bites over many kernel releases
> and slowly gain confidence and field experience with the practical
> aspects of fuse passthrough - and this includes the api questions
> and which opt-out combinations are important and which are not.
>
> I suggest that we try to focus on shipping a useful feature to
> users that are going to use it - that is - your internal customers,
> my internal customers and whoever else chimes in to test and
> provide feedback.

That makes sense. My original thinking was to land
FUSE_PASSTHROUGH_INO at once with all the features so that when the
init flag is set, servers didn't have to probe which ops are supported
vs not. I think what you're saying makes a lot of sense and is the
better way to go.

Thanks,
Joanne

>
> All the rest of the plans of subtree passthrough and directory
> modify ops should not block the first useful feature release.
>
> Thanks,
> Amir.
