Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16BC3803C5
	for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 23:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787614985; cv=pass; b=O1MX5J1KDmhE1qqpPoZQfv09PNsghK0v29DDSSVYaswtDaHUQbSQ8JywPkFXkhgZo1Z4R0UiYUqPtpgRqTlx1HcpbRbQoiY4StPMEvIznmRFjv7GGd8EbRZvOVbDljqS8wZrSncFYVV+AJF41jWUMrhsl+0fxqPJ9eFgAi4rgTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787614985; c=relaxed/simple;
	bh=sHnXZHT8WiiUeAdh+tKiJaengtnfesqTEZdJsUGA+8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLySR+CVMTAIARoFTTAdO/X3iF8l6k2GR7npBZVs9Ug1Gv4Bu+akxklvHVxBAkyprCbc0bnEAJF2lVkrdCSTpgK77e8PuQBIRLcMA9RV+GB++a6lsI/D+D42/6D2eeCy64hrnjtco+Buk/WHpZqEiqbUZgimFw3HPcsyZUuSXyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpRm02D7; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpRm02D7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so24838545e9.3
        for <fuse-devel@lists.linux.dev>; Mon, 24 Aug 2026 16:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787614982; cv=none;
        d=google.com; s=arc-20260327;
        b=OyweMqhXbWxyWsJTx/Z/F1qx/ENu8Q0X6Z5niuEDkeG9xzFCvp20G49hgRkm50CUXK
         hyh8GbigYslzV8W79mPeeVfVHa2J+gaKiqEIIzJ+qDd2lRAamRJFXbw0Edf1Vfiy8xty
         SWHytZ6cCpUa/h1TPL9nLD+5RjczecryU1jeCT5yFwjyk/JYVTBDPhQxCJFeqrKwFOkJ
         45IsylR/hjzm9yRZhzn6AdZRToLjhxj1s2G4ihOZn7aW1wn2jAfYDxxPMB7qxNEN7hWo
         W0VRfpFla40bezooyYU/Lssv4/YZTorieojeJLcp9jCJXBZkqojS1b17e6t/TWRfegRU
         a8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHnXZHT8WiiUeAdh+tKiJaengtnfesqTEZdJsUGA+8I=;
        fh=PHsg2IQJSyJo2HpekVcqcXp704eNtAyY4yqDXcDTXJQ=;
        b=NPN8y60G+YvEkwH9rbmZonu1X1SwseRsZT8tM9yPsTTjjtHb93X0ybCd5ugU3L2vaR
         ZPB6MqUnU88GofnnaeWZDxcD8TxiucbX+0GUWc6kiYWJzHQNDAmRs37s1upqKL2pAk8J
         V4S+AiRYuE+iqCfc5KnhQUnYfGpKHZvUO/6+Iq9lI3Yn9vellseuxUMc5V7TWRkQHVvy
         ecz+VgrurTmSj7IxY9UHgYC0cnw8sEWla7zOgmIXj1wCXYMxSQGWmDep2F3pBuTbWKdz
         1zlk0fhO0mHGhb/fBttSWiNvCw/DoV9OOKkgxpsfkBM2khMAshwZvsA21bkxZEE3ZuxQ
         n0Mg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787614982; x=1788219782; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHnXZHT8WiiUeAdh+tKiJaengtnfesqTEZdJsUGA+8I=;
        b=NpRm02D7bI6hFkdOIrfwlHuXM5X/MDkKaCE1FknPc3qtjo31CuVhSYAB4CSKDmP8wk
         MMGv40CwG3LAmAZFdGqRLGiVCuMAYqyfFcxnjxvQJtGEAfdZQo/rX1pmE/0C2SxykEKV
         cVpq1TQ897bI74mgjuK+Tx+2HYDGKYrh1JGhK1jpX+4Jf0yiFay5JRRHfBbWWavFQxXC
         fKmQo3V8Ix1KvpsoaCzUWE9Wga59ZkmCbDfmBYweIBiz2aQ2VDdChgGp8wqpKbil0eGX
         3KdvYVNddC8XvHhQn8ux/1aCUrRfyDbsqA0jNGnndNzXRJt7fvFZiHX1HmQlMTp8FjaM
         SNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787614982; x=1788219782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHnXZHT8WiiUeAdh+tKiJaengtnfesqTEZdJsUGA+8I=;
        b=ntjuTESbwZwP7GD15gBP7F/Wf85HOIHfegiejERM8TC+ZHkC4LrKbTfJUn4F7A7efo
         dIM8cHm4jGbvgoVyvm+8iZLEu7/IQ1jNa09zbUlxrlriXdkSzb5PjbQfXAG3KlqX/jfZ
         jt+QLBMv3Y4g73dmup5UAcbpL9UkqdfbzTzAmXmZduNSjsVToh5hfGB0IVgb0P/VR6Qz
         ZyMnt1uVoYsD6MOJLEvTRY8ObSP3Hz/vz+w+k6kZiDukHgVOkT+AdXsK/Uf70x2YMlYn
         G1J/037l4bEjmQotL43JVGG0t16Zqy3crX3u4btCa6z2LoT+TmhgF0CUF+pLJjxtx5HS
         Ncnw==
X-Forwarded-Encrypted: i=1; AHgh+RpQLAiWARZ2bFNF7CKiKK5uZC+L7GY9Jx4DkIvSYF/aJKTcqgjbpDSEKfjdJOknleQ45lJSZQcgTXko@lists.linux.dev
X-Gm-Message-State: AFuF++nGDzIklD3qGpQ+0zHo0JB8o06eugXpiI+uNEOwQR+rgWc5EdJv
	x+UR1FfqUNloRBgN9OTdiBWOKk3HWDupaK5xuDCB78RvYKsZizjTrpsQWvujkrogbxCimY39X3y
	TqaZKhDLqBJA8OH1li4aLhZxmm775sIE=
X-Gm-Gg: AR+sD12DeMz5hLhYwzvBA8oFLqoFKtIZL6Al2VD+RshAqCXNQvlCCT7Y8INwzPbnrBi
	cl02YFji1/Pb+pMfhq4PeUlYsSQrGacy5Z11GZ/1jE6pTQtbm9GVrw70ap0+HGMi5M9iZ1wwlm3
	RGSaQTebZTufN0tG4nXGYenjIYtV9yzwoQVnaRLXYPEroI4M5bIAbYC2cdAXCQrCAEb1v++sG7r
	eRFutaGG8D+vnRb0cqDBrmjEi6b/pedDblyLHWO9OCWVr6Qs1udMCme3odsQ9u020Af2UPz4Niq
	2yt9UX1lrqFYpQ9yVMMwbRhRGKW0DCqCXXqA5zdXoIKJbBrjfMRtkXmVdRqPuNUv0GEdPn+r7sZ
	H4jMuLuiQqMGFNLAqL9tUBnFmO5g=
X-Received: by 2002:a05:600c:5294:b0:499:7f38:d77 with SMTP id
 5b1f17b1804b1-499b830f690mr402396315e9.6.1787614981730; Mon, 24 Aug 2026
 16:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJnrk1bk66ZhRAS7mojSnD5RBfFS+0ChAPymE3ObRWr0C_udWg@mail.gmail.com>
 <CAO9r8zPpe6fWOSXtRUjFB8WNMroeBqvLT+2QtAU4E27AtLUXMQ@mail.gmail.com>
 <CAJnrk1YifN22mA5PFRVrh3m_ygxax6x4_8nraG2hPqCzyzBj7A@mail.gmail.com>
 <anpsLy_pCanocgS1@google.com> <CAJnrk1Yoj7fqbzurmHkbA-vegpQu3cf-_dfvKor_VxuNhPR-AA@mail.gmail.com>
 <CAO9r8zPLipVW6bvyDK1ypSawbo=LHKvmLqWH0xA6WMR9GYNJpg@mail.gmail.com>
 <CAJnrk1ai-TqcudPoK-qFRYAJnUjBmg1kVa6Vxg3eDm5w5ivqSA@mail.gmail.com>
 <CAO9r8zNJ=Fpc0pZExrttVTDCM3yzSmLPCAU=+RS0k5Pm+hY96w@mail.gmail.com> <CADrL8HV7_f68qfd6hG=xCTqzupPqr77ynbwdz8jm0hzjdgDVeg@mail.gmail.com>
In-Reply-To: <CADrL8HV7_f68qfd6hG=xCTqzupPqr77ynbwdz8jm0hzjdgDVeg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 24 Aug 2026 16:42:49 -0700
X-Gm-Features: AcwNN1Wa1AOcfS35Y1v_bgY_n2l1WDv-MkAP-PHL7EYAY7Mw9O0j_aJCxbHrZ54
Message-ID: <CAJnrk1ZU1UO35n46acq9My77G8=h3JUCLXchiamBCFbiDZXJzg@mail.gmail.com>
Subject: Re: memcg stats flushing (WAS "Re: [PATCH] fuse: disable default bdi strictlimiting")
To: James Houghton <jthoughton@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Jan Kara <jack@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, kernel-team@meta.com, 
	fuse-devel <fuse-devel@lists.linux.dev>, Jingbo Xu <jefflexu@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	linux-mm <linux-mm@kvack.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Yunzhao Li <yunzhao@cloudflare.com>, Song Hu <husong@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 6:39=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> On Fri, Aug 21, 2026 at 12:41=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> w=
rote:
> >
> > On Thu, Aug 20, 2026 at 4:39=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > > Would you be able to share the test you're using? I've been trying to
> > > repro it locally without much luck.
> >
> > The exact test uses some internal testing libraries, we're looking
> > into whether we can translate it to a standalone C repro.
> >
> > From a high-level, the test:
> > - Creates a VM with 260 MB (256 MB for testing + 4 MB margin) in a
> > cgroup, backed by shmem THPs. The VM is not a fully fledged VM, just a
> > KVM VM running bare metal code (so 4 MB is enough margin).
> > - Enables zswap in the cgroup.
> > - Tells the VM to write to 256 MB of its memory.
> > - Checks the cgroup shmem usage and that no swap occurred (no limit).
> > - Sets the cgroup limit to half the VM memory.
> > - Checks the cgroup shmem usage and swap again, usage should be ~half
> > and so is swap.
> > - Tells the VM to read the 256 MB of memory again. This should cause a
> > lot of thrashing and reclaim, but no OOM kills as all guest memory is
> > reclaimable.
> >
> > With the ratelimited flushing, the test started flaking 5-10% of the
> > time due to OOM kills.
>
> Hi Joanne, Yosry,
>
> I've attached a reproducer for you (as a patch that should apply to
> Linus's tree).
>
> In tools/testing/selftests/kvm, `make` should build it. Instructions
> for running it (like setting up swap/etc.) are in the comment at the
> top of the file.
>
> As part of the patch, I've also included a sysctl to dynamically tune
> whether or not the memcg stats flush is rate-limited. You should find
> that when it is rate-limited, OOMs occur, and when it is not, OOMs do
> not occur.
>
> This reproducer behaves slightly differently than our internal
> version. This version, when run with `-b 512M` anyway, seems to OOM
> simply by setting memory.max, whereas our internal version would OOM
> upon re-accessing the memory. Not really a meaningful difference, but
> just wanted to point it out.
>
> Please let me know if you have any trouble running this test or if the
> test is wrong in some way.
>

Thank you so much, James! This is very helpful - I will run some
experiments with your repro this week.

Thanks,
Joanne
