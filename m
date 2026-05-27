Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CFC30595B
	for <fuse-devel@lists.linux.dev>; Wed, 27 May 2026 01:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779846171; cv=pass; b=CBQUp6i745l0dnjObq/0jqaediJ+ojYEx1X+cBJcq95fIXboUqE1KU8bwZBRXwA6gJuzgBvafKbhIk6JUWxnO2nKluT3S/oH7D/iOG45dxLTdmKQHzPEbXfK6Qai1CGqPIKXCk+wywIrPIGp2G3h1gpjDhnLOJT4PgL2T8wBBwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779846171; c=relaxed/simple;
	bh=3dDU0ovfNjE8Z0Ui/Fcwy6KzdmHMn4n3K608kNqE59c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIjYPcP/uc6y4Vu1fINtrqNHLUXwxfJRD+x0y29F16vhWlIENEIqiCW5TUF9oe93AfySfRtYdBAn33+9PCweeUoW2frd//MNyrZpycNie+xnoG2gSkYdijFuMJtm1P2X5N0gDpDuPfkuaoKNBMuGNXB6JnJR1wPJfBoeAHkRNbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oor5xSa9; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oor5xSa9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-449de065cb3so10963500f8f.2
        for <fuse-devel@lists.linux.dev>; Tue, 26 May 2026 18:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779846168; cv=none;
        d=google.com; s=arc-20240605;
        b=LEVCTYIkhhox3aKigY4AY54e0HW/qmNMdhXdQTlE92ZzjxpId14Ca1mQbu2zTiVE9q
         rt3V9GCEXzujyJG4OqTea9lAXNcCQmjrMLOc/aovdCMHaXKSw0nnlV/QWy9jhQXTYxH2
         dbit5/DTIC62cCoLgDKTwkWnPyN8VIRBV40yUlmFvbvnG6P0EhrVAw+YVFlCZtDFrbaU
         KzSN5hK9qvqwS+dBH4Ivo4ZGCbMGUO0H7NnmcLkddo1P1jb+qJKEH433HlMNlyldep6k
         0dh3WG+VMwlxXbCVixrjgmY890Ow3BNDPL59oCDvpvDMTQroB5jVJ7CyC92FJhNS3T78
         8p3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yiTKTKgoPDZ1BR8UlSt0W66yk+nGv8FOARy53b7PmkU=;
        fh=MeqtulwUrprxAZkIP3qcXTHHNk0Er/+qQmjDfjXCFIg=;
        b=Dtt2+yBA602mVJgiv5pKs81hfqcf4+mlw1LrJS8xNhPmR2akp8ek9StHUNHezUuHwH
         VHFdU+u9jmjuVudODkM9JeBQFpzltqb7Lzq2eBV1dfA8V0e6zkhgWtIcvflo3jNzRJ/t
         Qg6xz60L6DzlMRfuJ6OucLP3heOmTJxvWuelmsrDFvM9nrnI5Vk/zk27UfmjsLHYF1H+
         bNJe6hVbAjjJwOxn4cY/+bR14wZ6mMQMHh4g2mbWnfRB3KEmFPR90q6/xccJ5PbdIXZi
         ApDBBzv5BJBCIJZ8/lLMNRUIZkn9IeU0jkNEbyfXIe0kSyH+QOl+ywty8PPg1vpFxQhM
         nHSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779846168; x=1780450968; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiTKTKgoPDZ1BR8UlSt0W66yk+nGv8FOARy53b7PmkU=;
        b=Oor5xSa9q+qqVRKV9B0xJq4X7Zhj3izaN9GZI8fSeaOTeBYWJgb8e4HAqLZZO8D/xN
         G5XngHN2cwy4Zxnr4RxOqoCGj3vBnWJ4cXxpYUA31CX2UyWcH5aTai/mxn4cwnz0Qw/b
         j0gKiRAzZDt5KaleE3flxl+oNakx3GNTjl1TevVV071ipDneJXpS9mluhEht0C1X32mn
         lQCrADFIO9lsxf6j79a/BskebRsJElIS7CAtGkeHkiWjLQ4GrDKkjxiQZ21r58FpB5se
         FH1pM3hahZ+eCQBTNUwn2z+43VUS/Fu5Ktdi9JTrvHnHRq2mCQEi5EnRnQyVEsFoLyA3
         WUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779846168; x=1780450968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yiTKTKgoPDZ1BR8UlSt0W66yk+nGv8FOARy53b7PmkU=;
        b=i12HlsiT0sQek59RSdO9p/CDeAAlQrfbXHY1WU7Pj76ri4TYnbUxdR7K0ALJFobBpv
         e1Li8REYR3tLrdX/RUKGdMgTM0c2Li74MHHyfoKyJ+RXkT/j9xCCLm/JiSHS9piZhklN
         hfLZMH9C36QTZeQQUdzIJBZ/WAhq2/XTSzPSk+7HJzCWxboX9R7Q3SM6BWSdzKrx3/8b
         0/kQiOsjAjP/oUxora++EGTVQ9Q7AiwXM3RBsfrzEJiFocPI/A7ljXzOXZaxeYIOVIW4
         VTUjdjGpDHsWDashOtznAUOr+QbN+k/TmFmHvF+wrosf0izj+05SNjYBjFBjEmjm4tsK
         ab9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+rjDu0LjzRVVUr61QaWTtu+tdn+Ofj3HdTOXW/rrdD0v5o8Wb6/jwhzbXiX/jBQwHg8FKkK5khJx+b@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj5oIQZ7thYJfjKJHGUFi3gposMsC2XyS+pFdEVa2wlp7g61xr
	zoTh8HcAblfIGzrs/8W/wdCxKa4Othbb4kXdIRhQRFZlBB4qL+DkmSxeTJ6UyBzatgjUwg/tB9w
	HGmsLEpCZUGdyPdMmFG6oYol8/LILNzyKu4Xk4yQ=
X-Gm-Gg: Acq92OEdN1X5a+dd+N4c5Ikx+8zb6Aajh/2hLVtX03uKHJAmDE5iAZXenK9IlaibjTS
	7Pj7lvGcDSDrZpPBYixE7PTe87dv3pMjeFKOJ4RKEsE6NCa5Y3ZJm9LmPUMHImm1FuZTFNFBPQv
	Nq+iXrWmGmQYqDM/oVLW0r34MdjVS0N9tFUtGlOB/ht6Eh+qEgcYKdpdSeHz5jZKhsU5I/Cckh3
	ZC0Hq1dgGoFXr6jEMXwVw+YJZukmv5UChvMxURqWQg5wGCc/R5UZp1LT82veZOz7z66/P+w+VvO
	zO5o5fbxN6OPXCjGH7RJaPhQvbSeDz9LCQ==
X-Received: by 2002:a05:6000:2411:b0:441:1e8e:d8fd with SMTP id
 ffacd0b85a97d-45eb389fd78mr36980281f8f.29.1779846168064; Tue, 26 May 2026
 18:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008204133.2781356-1-joannelkoong@gmail.com>
 <CAJfpegsyHmSAYP04ot8neu_QtsCkTA2-qc2vvvLrsNLQt1aJCg@mail.gmail.com>
 <CAJnrk1anOVeNyzEe37p5H-z5UoKeccVMGBCUL_4pqzc=e2J7Ug@mail.gmail.com>
 <CAJnrk1bx+32Tq5DOk6=C+_smV2HgP3+RT6gpYLSNMEirFs_EkQ@mail.gmail.com>
 <CAJfpegsy2XRR6g1J4Mg0MXPckx3NVprW56XvYhEko0=7PcHiQQ@mail.gmail.com> <CAJnrk1bZX44HaXmNMxEeEwhuFHgEjxXLnjKy8a-6T6LFuf+K2A@mail.gmail.com>
In-Reply-To: <CAJnrk1bZX44HaXmNMxEeEwhuFHgEjxXLnjKy8a-6T6LFuf+K2A@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 26 May 2026 18:42:35 -0700
X-Gm-Features: AVHnY4LDC1uj9DPMsbn9uvlPbEP3o78k-rS2ZplLroRxu5-_KduxQfvjyJpX7jk
Message-ID: <CAJnrk1aJwdY+fphnhHjAXFwjGqWQgVB+sn2Ce0gReein3H8EWQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: disable default bdi strictlimiting
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jan Kara <jack@suse.cz>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 1:56=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Fri, May 8, 2026 at 2:42=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
> >
> > On Mon, 27 Oct 2025 at 23:39, Joanne Koong <joannelkoong@gmail.com> wro=
te:
> > > Miklos, could you share your thoughts on this? Are you in favor of
> > > disabling default strictlimiting? Or do you prefer to have it kept
> > > enabled by default, with some mount option or sysctl added for
> > > privileged servers to be able to disable strictlimiting + enable larg=
e
> > > folios if they use the writeback cache?
> >
> > So what I think we should do is implement some sort of slow writer
> > test, and see what happens with and without strictlimit.
> >
> > Tried to ask claude to do this for me, but not getting very far.
> >
> > So if I take this maintainership role seriously and not let myself
> > drown in the details, then the logical thing to do is to delegate ;)
> > Which is hard (for me at least) but I'll give it a try...
> >
> > Could you please check how things change if there's limited writeback
> > rate and we disable strictlimit?  And what happens if there are
> > several such instances running in parallel?
>
> I think for unprivileged fuse servers, strictlimting will always need
> to be enabled or else a malicious user can launch tons of unprivileged
> servers and eat up the global dirty page budget / starve writeback for
> the rest of the system. Similarly for privileged servers, it could be
> unintentionally slow or buggy and eat up the dirty page budget. I'll
> read through the writeback throttling code to verify this and run some
> local tests.

I read through the writeback throttling code and re-read Jan's very
helpful comments from this thread last year [1]. So for unprivileged
servers, I think we definitely cannot remove strictlimiting. If the
fuse server is slow or unresponsive with writing back the pages, it
will take up too much of the global dirty budget which will degrade
write throughput for other filesystems (their throttling will be
computed against the global dirty page count, eg the freerunning check
in balance_dirty_pages() and the pos_ratio calculation "pos_ratio =3D
pos_ratio_polynom(setpoint, dtc->dirty, limit)" (dtc->dirty is the
global dirty page count)) and any fuse stuck dirty pages are
essentially unreclaimable. Without strictlimiting, there will be no
hard cap on how many dirty pages a misbehaving server can accumulate.

With strictlimiting on and large folios enabled, the problem is that
the large folio size can potentially dwarf the server's dirty budget,
which can lead to excessive throttling. When I ran my benchmarks last
year, I and independently Jingbo saw severe performance regressions
for buffered writes with large folios (eg 2 GB/s BW w/o, and 200 MB/s
BW w/) [2] but I think that might have been because the machines had
limited RAM, resulting in a very small dirty budget. Fuse sets the max
ratio of the bdi to 1% of the global dirty threshold, so running
through some napkin math:

On a 64 GB machine:
  - DirtyThresh =3D 20% of 64 GB =3D 12.8 GB
  - BdiDirtyThresh =3D 12.8 GB / 100 =3D 128 MB
  - 128 MB / 2 MB folio =3D 64 dirty folios

On a 32 GB machine:
  - BdiDirtyThresh =3D 64 MB
  - 32 dirty folios

On an 8 GB machine:
  - BdiDirtyThresh =3D 16 MB
  - 8 dirty folios

On a 8GB machine (with assuming vm.dirty_ratio=3D20% and
vm.dirty_background_ratio=3D10%), we get 12 MB of freerun, 4 MB of
proportional throttling, and then full throtttling starts at 16 MB.
With 2MB folios, the 4MB zone between freerun and f ull throttling
doesn't leave that much room for the balance_dirty_pages() logic to
adjust the dirtier's speed, which I think causes the writes to
oscillate between freerunning and then being fully (overly) throttled.

I think this is also going to be a problem for cgroups with large
folios since they also, as I understand it, are constrained with a
limited / tight dirty budget. I ran some initial benchmarks with
cgroup memory constraints on NVMe and saw similar instability (a
single writer in a 8 GB cgroup had max write latencies of 6 seconds vs
15 ms without the cgroup, with the balance_dirty_pages() throttling
oscillating rather than settling near the set point).

I think this problem gets untenable for random writes with large
folios, since dirtying just a few bytes will charge the whole folio
size to the dirty budget. I have a patchset from last year for adding
more granular dirty/writeback tracking [3], I'm going to pick this
series back up. I think it will be useful generically, not just for
fuse.

For getting this to work on fuse servers with strictlimiting, I think
the next steps are to
a) as Jan had suggested in [1], come up with some heuristic to
constrain the max order supported for large folios for these fuse
servers if they're running with the writeback cache enabled
b) benchmark ^ and if there are still regressions, then we should
probably just turn large folios off for these servers
c) add the granular writeback/dirty accounting for large folios
d) look into improving the balance_dirty_pages() throttling logic to
handle narrow gaps between the freerun and full throttling zones
better and reduce over-throttling

Does this sound like a reasonable way forward?

For privileged servers, I still think it makes sense to remove the
strictlimiting requirement or at the least, let admins opt out of that
if they are confident their server is well-behaved.


Thanks,
Joanne

[1] https://lore.kernel.org/linux-fsdevel/tglgxjxcs3wpm4msgxlvzk3hebzcguhuu=
752hs3eefku6wj4zv@2ixuho7rxbah/
[2] https://lore.kernel.org/linux-fsdevel/f9b63a41-ced7-4176-8f40-6cba8fce7=
a4c@linux.alibaba.com/
[3] https://lore.kernel.org/linux-fsdevel/20250829233942.3607248-1-joannelk=
oong@gmail.com/

>
> I think the question is whether we want to let admins opt out of
> strictlimit when they're confident their server is well-behaved eg
> through a sysctl an admin can set to disable strictlimiting for all
> servers. Otherwise, large folios will always have to be off for any
> server that runs with writeback caching.
>
> Thanks,
> Joanne
> >
> > Thanks,
> > Miklos
