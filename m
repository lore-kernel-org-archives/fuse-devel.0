Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835BB3ACEEC
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080234; cv=pass; b=gr9aoMWWVy2IbOh/3gRVDTFLStDrkQRS9UKuLVXkvxjSEzyemh+yE7BK8lpcRATyhcU/ca6J6ihIU7LzYfvU7skaZDFnFQOgVTqYR5Z4uT7/i+nFaFH3/mNoHndF6LxSfjTAbJnjJyFTho6G0N8mFaNy2aAVLGeUtEiP9YuQ4vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080234; c=relaxed/simple;
	bh=0fVZj+B0J3dwIitcYfV+c+e+wYQZ3Xdw4W+pIVFN7PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6hwREpPYg3TRZhwRDFGTrX2aX1iNNrBf6+gsoyrov0tinmBiDtd2o4q74PCQPdOlqsLNj4dsG2uvaz0XJC9+0+NbPRoelLSsxW391KsX2QG6+z4Pmc+XsMLShRQEJukesJF1Pm213j79X99TIlszQGazCJprrS4ejn79Jf4/wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=UxUnemsa; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="UxUnemsa"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-517b1f2c6adso33650321cf.2
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 01:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781080232; cv=none;
        d=google.com; s=arc-20240605;
        b=PCQ5n3W6QZSQUJ/YzythxpA7EeoGyiJYdujC1nnTMmFjWjttgAV4viaEz0iZkDhSNB
         2mCce2Wu3ljyANdm7Uhv/vVsmZo9eJE2LMoQmbW3tk2Jj/Wl1ajIJHxZ2NpXbL3kcjL+
         edwDElfrQzff5zZKDeqSs04GysvDtXGor5lxP0iuo3b6nQ1Wp7qpnvSUBBkoC9X231Kh
         ug5/W762ot076mxpNxyFmLqq8upEgEvw0eNABJ7jWNxrJTlGM+SGG5g+p5+tNlTdQsvC
         jwMNK2BKvaJPTUeNDSD409leqBn545tuZdvG8PvkSjnvwswD4zL2wRhSVWiD3hEU+YRA
         +P1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZroBHSm24go7M+mCkUF6kgKbifkFcSIuzieTPeqjNh4=;
        fh=JOvxalT8Ae3IX2htU+opogeeIlnswtWyuBAt8V53W1k=;
        b=X9tIgxiO7wDQjdgrENG3WQ6DbmHFSfAUn9lvgn89L/NioQa1Bxv00giNHJyv5YNC7s
         5joxlF384oAdgVxzwv3Cj9C2WEkCsrSiN9p+IOlmdvvQvrgCf18Jtix7s+AV0N41dp4e
         m1GJfXBUHXgnAA2aGeMs5f5ZcuVnbqEwJxrPVSLvRG1BNkEW9Hy3AslAAtjjt4MVEs9Q
         hHILpTQal2CIUN6elZYTiwBuKp6gMkOL+apOk/ia+ebksSRjDsBS1aPiUq0qTYTWisKM
         27NSGCaQoaYEtQWi6DOpTP7V2kgcWAUxR1yOk4027wMwDda730oxjI6+MRCRCaZbSYkj
         UWbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781080232; x=1781685032; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZroBHSm24go7M+mCkUF6kgKbifkFcSIuzieTPeqjNh4=;
        b=UxUnemsa3CLmpb/sSAMSgtwl3fLr1u9slJKoZAYerccasiK9bgtYbZF8RkFxEZS9HW
         O6iQR+kt3gUyC/k7eSsQ5mxabdkr1DDCN52Q0RF83BeMql5xqN11rni/lJAN7OELmgNN
         mkroE2j/l00x70isfNXxmmYJxAfMuCkkbip9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080232; x=1781685032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZroBHSm24go7M+mCkUF6kgKbifkFcSIuzieTPeqjNh4=;
        b=apqLj/TD5EPwXfXliWhcoO7pkz3U8isI8TRnZAnH24Yxx9XQl1mhs8iwOJRDAe1UOD
         2AvJ2SSYwcMka6swFP0E4N3/6fndwqXmLpbK5Dab9Rdg3oWKt3DvNNQ2Jg7BOfe8/ayN
         FyOZxaf3CGcABQU9BxVPeM7kvSnnzGOi9HRPcHqL4gSF96LK19QRqNlE08XMjMXrb8O+
         C6ZLPhP2R+o55cUsew3a/LavdgJ1+Bh0QTvy8taOyaqbEXBMWHTkAGMSZWdxfk4Cgj8g
         8hfFEG29J3xxIivvcUs0MJeFBNFWTbVwzQvGh9MorayFMs5e3tEbjSUm8gbhyPPR49jA
         70qw==
X-Forwarded-Encrypted: i=1; AFNElJ+c7yFzPnbTTHOmFBvOiEv+i7NrEblhsahqOymtO+Vf7XSU6pgj2jGWRQgXXb6gfuD6+PlpccCzZHtx@lists.linux.dev
X-Gm-Message-State: AOJu0YwtfEvMEnqhWqFN8I6lPNLlpar5QSVgS0i5zvL2b/7xBlNIqfKV
	aHSb3MmjW8Wfa11ERHLQEQfHQJ9oQTtLxyKCNqnmhoo9K8BACBQMDm17C1/df6Rh2lk/4FYl8nU
	ejdkswXhatqYuPIYmc6tWK7tDMns96Dzng/z6s2MoGT4HKTvHxjpUwhk=
X-Gm-Gg: Acq92OGlmeab/qiRAH0aZ7ls2UxV7bSIYmqFwpfMMxwdaghPZws9KNd5wGHjoMjkj6f
	erTigGWX1OLv/2BkAQ9kONT1kFEnH1bIkuvpI79zIPgUnBk331wcBvrplC9wwieUhaRiI4kNQqd
	wjSvaA/RFiOf4oqktxEyBkHP/PmbM/ZtFFfmwIq/5GgvHZjDrGufLmamcVXuia7M+bJ9EoDO98B
	zv0whFlStBLRljy2+l4w/+14HmeP4yxEvF5DoBpKoO1xvChcV2yZY3sXK6FR5pQ+P9xFcNdxiJl
	wJzxAsR0EQbekwNVN7QRsr6EEszzSCaGCIQYjN6tf2xeDEh2prs=
X-Received: by 2002:ac8:7612:0:b0:517:a02f:171a with SMTP id
 d75a77b69052e-517a02f1d7bmr219150361cf.36.1781080232191; Wed, 10 Jun 2026
 01:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601212414.1154139-1-amir73il@gmail.com> <CAJnrk1YGSrEkP2O-JPpie1zqc_5tBH9uHFvMry18TBdCMytNKA@mail.gmail.com>
 <CAOQ4uxjCTCo2SQcuVWt+E-BapjrHWBcqES2PQOcwDFZ+2KgXFw@mail.gmail.com>
 <CAJnrk1auhoGN729ptGN4aF0akoMd+oKebBcK_2QNaaoyu8vbzA@mail.gmail.com> <CAOQ4uxgR=1pgovTY2Y3s3jfaLkuyDspm9AFk0XpDnbJ3uv5cjw@mail.gmail.com>
In-Reply-To: <CAOQ4uxgR=1pgovTY2Y3s3jfaLkuyDspm9AFk0XpDnbJ3uv5cjw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Jun 2026 10:30:20 +0200
X-Gm-Features: AVVi8CfTKscXAqbNgOpMBcRJqRY_kpmUaLEqHhWD-EsGJtoPm7iciX0wqmqM_z8
Message-ID: <CAJfpegvUzAhFtLc_RvomnhK_Dfp_7u_r=7QUfopot2vYJoUN8g@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add fuse_request_sent tracepoint
To: Amir Goldstein <amir73il@gmail.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd.schubert@fastmail.fm>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 17:08, Amir Goldstein <amir73il@gmail.com> wrote:

>     fuse: add fuse_request_sent tracepoint
>
>     This new tracepoint complements fuse_request_send (enqueue) and
>     fuse_request_end (completion).  It fires after the request has been
>     successfully copied to the daemon's buffer, just before the daemon
>     can start to process it.
>
>     fuse_request_sent does not fire if the copy of the request fails.
>     It also does not fire for NOTIFY_REPLY, which fires the _end tracepoint
>     at the end of copy.
>
>     This is needed for tools tracking the in-flight state of user initiated
>     fuse requests.

Applied, thanks.

Miklos
