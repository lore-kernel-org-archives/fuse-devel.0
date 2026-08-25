Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C75B296BC8
	for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663013; cv=pass; b=pVfn3CMF/hwN+cf+FLX5Ur9qhud/GUnPzJ3PgoaLptxETc7dCjjTbxKemNltjW/gR05llHAhZBjgFVvLYZxEaLQcF6vsOQrk11yCpxMO0jg0rIVw8VSlA4mVraUDxqOPhVtca+xeg3hvh50IUbL72fzqh9kD0NMLLnHeBN9eiOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663013; c=relaxed/simple;
	bh=CUEr/e5MholbNaYQzXTmEQ6JBM5Dsq0Y//IYN7xJv38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvI1WrOAUCTZoC3mbzQaHWaN3SP3oZr6RVLY009Na8peLrNRRdmNnSMRL32aiXIi0SLQS0rnUo4aoQMjKEXEIX+filjBre2WvJUePRcv716S1NpTPtudgcYgYl5qTuEwjKz6kiDRiR/POHXAoova0TL1szE6KbyypPbiIp7Qzsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=fykuS/kf; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="fykuS/kf"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51bfa429aa6so4393121cf.0
        for <fuse-devel@lists.linux.dev>; Tue, 25 Aug 2026 06:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787663011; cv=none;
        d=google.com; s=arc-20260327;
        b=XSt3PpLCkC1SdYDq/OpFdZ0L6r4z+QPCHJZE+4JBtcrWp+RWurYa5j4y42gaxLz8Jw
         7UW4LlKt2E7wV4H65FEJJ4l0VgnUtoCd9mecisjBMIi8G6xQnMesojYbb5KGdbd68nJ2
         Yw/5v9GnMUQPDC4bjGqG+0uq9cN3XxlYYrzsn6M7GsnXGPIzhLFH3qZJD9bP4bCwwtBw
         MLrgomPTYM999DrScD3LatojmYMltfKE93Y7JkDgIhrFAqZm8YVe2VWMepGadapG96yS
         iSBmrgytOXIDOG+4k8ygqwvETvMcdWkI2r5UlDIn2zlFa8TUBsVZMFmwZ3mVVoOUsu5C
         bQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CUEr/e5MholbNaYQzXTmEQ6JBM5Dsq0Y//IYN7xJv38=;
        fh=/ayxSprbVnal+qi9czzY2aY0tcf9jBUUcSaj0qcbQTI=;
        b=Y4EyHfr9+BZpPerqeA3BN4fXPsD3tIk76zNxLVPMAgkRJVYARTFTD9IvMj2AFnV4YQ
         TEDe/ABQXCu+dBDeNW0TOt1VbZKbW0p3wvpKT2XJBwWln6S3H0BdZjJCv9aBEfOhsAs7
         DE334+7ajQwXfuyjVsGnlOwx6/Hg2M+1dy4QsMmbiRxUg1C+YXy3JQUTdoa35GqPSPGz
         LKqcie6s5CWS4mQNlhs9IvXpJHCBpCEloYEczmnsP8Dg/8ot210vGryLcf20OtyOtqsv
         tMlYXdDNlBoHxL1fypgfBdudaL/9fXCR7EcTPi+qGuNmL2Rx6EF7taeF8vJ+rGOUMVvQ
         gIiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787663011; x=1788267811; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUEr/e5MholbNaYQzXTmEQ6JBM5Dsq0Y//IYN7xJv38=;
        b=fykuS/kfIOG6J28lAS85unf+NTL5nXRj5fmHomz8UvS2iOouZ9WfmK7AhPUAvMwSxp
         lbxSFn6MjzDeEuZsEeMMgv7an8AiRtqn1HGTnduf7IXCQ8tN6jN+9VHi+KMwQ32wJV9j
         0ei1geR3ZyQOuCwWw60jo2xcpPrq47uhNUWGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663011; x=1788267811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CUEr/e5MholbNaYQzXTmEQ6JBM5Dsq0Y//IYN7xJv38=;
        b=hfpd+VRFG1bI86Jeg2r9q6azYPOrdKC4uBpPYqelNaJQZ8O9+fuMUHaJMxe1lKwA5Y
         Rukq8EDerh0WA/h8DK49AlTg00uSWylq4d+WjGI2wOHgJQAX/IXczytLTHKvPdGUtwgt
         ZyM0jVF/Rzb1PT3n+sH4GCG4qQd1g/vo6cY6sekw5PL12AngNsU1zP3IsF6cvYktE1y6
         IL6EDQCnx2OlUaO/Wbr5xe9lRrtx94uvC1W67xNJSoDc0bqTV6M5Z6Gqk3vFucdbrIkt
         Z//F/9NIMXzE8Jx3v7eVIxFCjKqdhY7YsA2+A2yeleP0Uq3NAa9Xr3OtWddmtip06WSC
         zDlg==
X-Gm-Message-State: AFuF++ldIAsWHPN4nCXnTXMo6CftrLTMbaQZZkDQhYs+1ZXK4AejJqOy
	RIJ3to2qeAxthCjHhB7KNOFrnVvxyTT9JOourZmetarpWU4jLefS8xPkQ89GhlVOIt2NQknjHNm
	n7R9p4exYAuWr6vUmx7ubW+4GQ+bMpYn+Mq0dqoj6Ig==
X-Gm-Gg: AR+sD10FtBh2PpOz/wjFjlHqvcKO4yL5g3+u+xfAccoLOUV8MuuZ4M9OPfHVoHIt59p
	48EGbM+tEUhJXjmLxxwjtrk9rKBbSY5D5cCsOOoWHWq6hwB6Fe3HJFLLBmpYrblYl0DN4OgI64y
	nT+T8i+cx7LA2Q6NYr+sl53p6Fv4raOnG5wrhZxTEnUm7lRyAqGLGxFK0qQzR+/KyE+LVbgnV6o
	gV4xo7ZgdG8KbaoSiIljrBqMC/pIKkzZDgcB+DOatzOeCwNrn2MrBaEW+1y3HPrt/lMxenTVSyw
	f1faPvv4p7r7lBS1h1QlZXFlMCKd1f+QXnjjDWWJ57DEhEJVMyIRijbZy+sJ5o0w/1v886vCNlO
	NhUg=
X-Received: by 2002:a05:622a:118d:b0:51b:fb5f:b263 with SMTP id
 d75a77b69052e-52e2ec1e5demr67516461cf.4.1787663011283; Tue, 25 Aug 2026
 06:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820130158.254808-1-jamz@amazon.com>
In-Reply-To: <20260820130158.254808-1-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 25 Aug 2026 15:03:19 +0200
X-Gm-Features: AcwNN1V-E0YVDUa4WhV6OmS9gRNJfrQeO1sZEy5JreCrY0gVdVTUszFjJtAbGlQ
Message-ID: <CAJfpegsR1oNh_PnmK-a+k=6ttdpXYAyg6SsQe=ZMCZN03gvPhA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] fuse: allow FUSE_SYNCFS for privileged userspace servers
To: Jimmy Zuber <jamz@amazon.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Aug 2026 at 15:02, Jimmy Zuber <jamz@amazon.com> wrote:

> This series lets a plain /dev/fuse server opt in via a new FUSE_HAS_SYNCFS
> INIT flag, honored only when the server opened /dev/fuse with CAP_SYS_ADMIN
> privilege in the initial user namespace -- checked with file_ns_capable() at
> mount time.

Applied, thanks.

Miklos
