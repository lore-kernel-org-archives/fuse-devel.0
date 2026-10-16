Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67CB447255
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 19:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177643; cv=none; b=QW4wnN2/SEydjBHIgo5CWKOz43zEDTqGvQOlJN3vE0A2kfWde7B8xr/EZ+c5HJwnUc3FDMf7b59DL6ZbNNzdjJH2T2A2pnVEeL7CM1bLGZJrRA0e3c3PLcE1qL3LcJahx1tEe5hVNwDtVP3c/kc3i+02wrTF6dVYRv8D6dX8AHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177643; c=relaxed/simple;
	bh=+97d7rbSwGbaZIoD0wQh3WPhyssbaxdaN4qaVolHfqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dsDgqiMdR/ITTNrVTYFmYYCELQV8bC8b16fnltmtDRJVGfDRa2HH3Kp3Mcge8bGIkWRvPfBkxRy3IsLf2Tfyk0Jq8KK1nxqJNoI2VYTKqRM6Inbtim9lg3HvxgMdQyGhBT0PiIyImfbCQmavrGJzhZVLj+ZpyDrSaptQmFLh4sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bPVQctMk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bPVQctMk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792177640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9GlfNbR2YXRyIjo1VTPGB8mf5pjH7iiMlshZjh/Itew=;
	b=bPVQctMkMsQlPmUl+aNGA/vxiaQC8Nrn+hcQOVQsYIlEhuBq50PYN/n84RMFdVeKrvkfdP
	SeKOBgN0K2MGyP4sn+EJ/6N9V48p2ogsmNsG613dovdAVlOFSuL+A9cRbKBirnTUKm9zSB
	9CB+qED7BFaXoKm9Ht0nFUrojD0+w1M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-108-ct_1LQxLPSOXKukd4DfL6A-1; Fri,
 16 Oct 2026 19:07:16 +0000
X-MC-Unique: ct_1LQxLPSOXKukd4DfL6A-1
X-Mimecast-MFC-AGG-ID: ct_1LQxLPSOXKukd4DfL6A_1792177635
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F16A1800644;
	Fri, 16 Oct 2026 19:07:15 +0000 (UTC)
Received: from bfoster (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1B33418;
	Fri, 16 Oct 2026 19:07:13 +0000 (UTC)
Date: Fri, 16 Oct 2026 15:07:11 -0400
From: Brian Foster <bfoster@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: xfs <linux-xfs@vger.kernel.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	fuse-devel <fuse-devel@lists.linux.dev>,
	fstests <fstests@vger.kernel.org>
Subject: Re: Farewell!
Message-ID: <atJ13-L1UZLO1U8R@bfoster>
References: <20261016160037.GA107919@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20261016160037.GA107919@frogsfrogsfrogs>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: VFBsa0uk8W4o0d5eYPRnjEwOB4q42LeFvFMm262D9bw_1792177635
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2026 at 09:00:37AM -0700, Darrick J. Wong wrote:
> Hi everyone,
> 
> After 14 years at Oracle and 23 years working on Linux, I've decided to
> take an extended break.  Today, October 16th, 2026, is my last day.
> 
> I don't have any immediate plans to drop the djwong@kernel.org
> forwarding, though ultimately that's up to the sysadmins to decide.
> 
> I have very much enjoyed working with you all, and I'm proud of what
> we've accomplished together.  Good luck!
> 
> --Darrick
> 

Cheers Darrick.. it was a pleasure working with you. I appreciate all
your work on XFS and all of the discussion over the years. Best of luck!

Brian

